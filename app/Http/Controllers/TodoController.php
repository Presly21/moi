<?php

namespace App\Http\Controllers;
use App\Http\Requests\TodoRequest;
use App\Models\Todo;
use Illuminate\Http\Request;
class TodoController extends Controller
{
    public function index(){
        return view('todos.index');
    }
    public function create(){
        return view('todos.create');
    }
    public function store(TodoRequest $request){
        Todo::create([
           'title'=>$request->title,
           'description'=>$request->description,
           'is_completed'=>0
        ]);
        // $request->session()->flash('alert-success' ,'Todo created successfully');
        // return to_route('todos.index')->with('success', "Todo created successfully"); 
        return redirect()->route('todos.index')->with('success', "Todo created successfully"); 
    }


}
