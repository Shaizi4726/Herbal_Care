<?php

namespace App\Imports;

use App\Models\Product;
use App\Models\SubCategory;
use App\Notifications\ImportHasFailedNotification;
use Illuminate\Support\Collection;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithValidation;

class ProductsImport implements ToCollection, WithHeadingRow, WithChunkReading, ShouldQueue, WithValidation
{
  use Importable;

  /**
  * @param Illuminate\Support\Collection $row
  *
  * @return null
  */
  public function collection(Collection $rows)
  {
    foreach ($rows as $row) {
      $cats = explode(',', $row['cat_id']);
      $subcats = explode(',', $row['subcat_id']);
      $brands = explode(',', $row['brand_id']);
      $images = explode(',', $row['image']);
      $forms = explode(',', $row['form']);
      $sizes = explode(',', $row['size']);
      $prices = explode(',', $row['price']);
      $discounts = explode(',', $row['discount']);
      $stocks = explode(',', $row['stock']);
      $forms_len = count($forms);
      $sizes_len =   count($sizes);

      $product = Product::create([
        'plu' => $row['plu'],
        'name' => $row['name'],
        'slug'=>$row['name'],
        'sci_name' => $row['sci_name'],
        'other_name' => $row['other_name'],
        'benefits' => $row['benefits'],
        'description' => $row['description'],
        'precautions' => $row['precautions'],
        'packaging_details' => $row['packaging_details'],
        'photo' => $row['photo'],
        'promotion' => $row['promotion'],                               
        'status' => $row['status'],
        'minprice' => $row['minprice']
      ]);

      if($cats[0] !== "")
        foreach ($cats as $cat)
          $product->categories()->sync($cat, false);

      if($subcats[0] !== "")
        foreach ($subcats as $subcat) {
          $cat = SubCategory::find($subcat)->category()->pluck('id');
          $product->categories()->sync($cat, false);
          $product->subcat()->sync($subcat, false);
        }

      if($brands[0] !== "")
        foreach ($brands as $brand)
          $product->brands()->sync($brand, false);

      if($images[0] !== "")
        foreach ($images as $img) {
          $product->images()->create([
            'name' => $img,
            'status' => 'active'
          ]);
        }

      if($forms[0] !== "") {
        $i = 0;
        foreach ($forms as $form) {
          $product->forms()->sync($form, false);

          for ($j=0; $j<$sizes_len; $j++) {
            $product->attrs()->create([
              'form_id' => $form,
              'size' => $sizes[$j],
              'price' => $prices[$j + ($sizes_len * $i)],
              'sku' => $row['plu']."_".$forms[$i]."_".$sizes[$j],
              'discount' => $discounts[$j + ($sizes_len * $i)],
              'stock' => $stocks[$j + ($sizes_len * $i)],
              'status' => $row['status']         
            ]);
          }

          $i++;
        }
      }
      else {
        for ($j=0; $j<$sizes_len; $j++) {
          $product->attrs()->create([
            'form_id' => NULL,
            'size' => $sizes[$j],
            'price' => $prices[$j],
            'sku' => $row['plu']."_".$sizes[$j],
            'discount' => $discounts[$j],
            'stock' => $stocks[$j],
            'status' => $row['status']         
          ]);
        }
        $i++;
      }
    }
  }

  public function rules(): array
  {
    return [
      '*.id' => ['id', 'unique:product,id']
    ];
  }

  /**
  * Import data in small chunks
  *
  * @return int
  */
  public function chunkSize(): int
  {
    return 500;
  }
}
