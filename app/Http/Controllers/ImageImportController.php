<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\ImageImport;

class ImageImportController extends Controller
{
    public function store(Request $request)
    {               
        $file = $request->file('file')->store('import');        
        $import = new ImageImport;
        $import->import($file);
        if ($import->failures()->isNotEmpty()) {
            return back()->withFailures($import->failures());
        }
        return back()->withStatus('Import in queue, we will send notification after import finished.');
        return $request->all();   
    }
}
