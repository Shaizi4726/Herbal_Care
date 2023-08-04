<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
      $blogs = Blog::paginate(10);
      return view('admin.blog.index')->with('blogs', $blogs);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       return view('admin.blog.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       $this->validate($request,[
        'title'=>'required|string',
        'post' => 'required|string',
        'image' => 'required|string'
      ]);
      
      $slug = Str::slug($request->title);

      $blog = Blog::create([
        'title' => $request->title,
        'slug' => $slug,
        'image' => $request->image,
        'post' => $request->post
      ]);    
            
      if($blog){
          return redirect()->route('blogs.index')->with('success', 'Blog Successfully added');
        }
      else{
        return redirect()->route('blogs.index')->with('error', 'Please try again!!');
      }
    }

    /**
     * Display the specified resource.
     */
    public function show(Blog $blog)
    {
      return view('main.blogs.blog')->with('blog', $blog);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Blog $blog)
    {
      return view('admin.blog.edit')->with('blog', $blog);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Blog $blog)
    {
      $data=$request->all();
      $updated = $blog->fill($data)->save();
      
      if($updated) {
        return redirect()->route('blogs.index')->with('success','Blog Successfully updated');
      }
      else{
        return back()->with('error','Please try again!!');
      }
  }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Blog $blog)
    {
        //
    }

    public function blogs()
    {
      $blogs = Blog::where('status', 'active')->get();
      return view('main.blogs.blogs-index')->with('blogs', $blogs);
    }
}
