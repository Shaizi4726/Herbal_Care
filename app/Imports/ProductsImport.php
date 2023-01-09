<?php

namespace App\Imports;

use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\RegistersEventListeners;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Events\AfterImport;
use Maatwebsite\Excel\Validators\Failure;
use Throwable;

class ProductsImport implements
    ToCollection,
    WithHeadingRow,
    SkipsOnError,
    WithValidation,
    SkipsOnFailure,
    WithChunkReading,
    ShouldQueue,
    WithEvents
{
    use Importable, SkipsErrors, SkipsFailures, RegistersEventListeners;


    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $product_cat_list = explode(',', $row['cat_id']);
            $product = Product::create([
                'plu' => $row['plu'],
                'title' => $row['title'],
                'scientific' => $row['scientific'],
                'slug'=>$row['title'],
                'other_name' => $row['summary'],
                'benefit' => $row['benefit'],
                'description' => $row['description'],
                'photo' => $row['photo'],
                'minprice' => $row['minprice'],
                'cat_id' => $product_cat_list[0],
                // 'child_cat_id' => $row['child_cat_id'],
                'brand_id' => $row['brand_id'],
                'is_featured' => $row['is_featured'],
                'status' => $row['status'],
                'promotion' => $row['promotion']                               
            ]);
            foreach ($product_cat_list as $product_cat)
            $product->productcategory()->create([
                'category_id' => $product_cat
            ]);
        }
    }

    public function rules(): array
    {
        return [
            '*.id' => ['id', 'unique:product,id']
        ];
    }


    public function chunkSize(): int
    {
        return 1000;
    }

    public static function afterImport(AfterImport $event)
    {
    }

    public function onFailure(Failure ...$failure)
    {
    }
}