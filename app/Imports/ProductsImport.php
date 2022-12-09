<?php

namespace App\Imports;

use App\Models\Product;
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
            $product = Product::create([
                'title' => $row['title'],
                'scientific' => $row['scientific'],
                'slug'=>$row['title'],
                'summary' => $row['summary'],
                'benafit' => $row['benafit'],
                'description' => $row['description'],
                'photo' => $row['photo'],
                'stock' => $row['stock'],
                'cat_id' => $row['cat_id'],
                'child_cat_id' => $row['child_cat_id'],
                'brand_id' => $row['brand_id'],
                'is_featured' => $row['is_featured'],
                'status' => $row['status'],
                'price' => $row['price'],
                'condition' => $row['condition'],
                'discount' => $row['discount']
                
            ]);

            /* $product->slug()->create([
                 'slug' => $row['title']
             ]);*/
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