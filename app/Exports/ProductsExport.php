<?php

namespace App\Exports;
class ProductsExport implements 
    FromCollection
    ShouldAutoSize,
    WithMapping,
    WithHeadings,
    WithEvents,
    FromQuery,
    WithCustomStartCell,
    WithTitle
{
    use Exportable;

    private $year;

    private $month;

    public function __construct(int $year, int $month)
    {
        $this->year = $year;
        $this->month = $month;
    }

    public function query()
    {
        return  Product::query()->with('categories');
    }

    public function map($product): array
    {
        return [
            $product->id,
            $product->name,
            $product->categories->name,
            $product->created_at
        ];
    }

    public function headings(): array
    {
        return [
            '#',
            'Name',
            'Category',
            'Created At'
        ];
    }
    public function startCell(): string
    {
        return 'A1';
    }

    public function title(): string
    {
        return DateTime::createFromFormat('!m', $this->month)->format('F');
    }

}
