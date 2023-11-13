<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
class DashbaordController extends Controller
{
    public function dashbaord(){
        $data['header_title'] ='Dashboard';
        if(Auth::user()->user_type==1){
            return view ('admin/dashbaord',$data);
        }else if(Auth::user()->user_type==2){
            return view('teacher/dashbaord',$data);
        }else if(Auth::user()->user_type==3){
            return view('student/dashbaord',$data);
        }else if(Auth::user()->user_type==4){
            return view('parent/dashbaord',$data);
        }
    }
}
