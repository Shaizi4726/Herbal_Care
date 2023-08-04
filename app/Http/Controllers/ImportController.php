<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\ProductsImport;

class ImportController extends Controller
{
  public function store(Request $request)
  {               
    (new ProductsImport)->import($request->file('file'));
    return back()->withStatus('Import in queue, we will send notification after import finished.');
  }
}
