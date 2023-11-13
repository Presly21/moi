<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use Auth;
use App\Models\User;
class authcontroller extends Controller
{
    
    public function login(){
        // dd(hash::make(123456));
        if(!empty(Auth::check())){
            if(Auth::user()->user_type==1){
                return redirect('admin/dashbaord');
            }else if(Auth::user()->user_type==2){
                return redirect('teacher/dashbaord');
            }else if(Auth::user()->user_type==3){
                return redirect('student/dashbaord');
            }else if(Auth::user()->user_type==4){
                return redirect('parent/dashbaord');
            }
        }
        
        return view("auth.login");
    }
    public function AuthLogin(Request $request){
        $remember =!empty($request -> remember)?true:false;
       if(Auth::attempt(['email' =>$request ->email,'password' =>$request ->password],$remember)){
        if(Auth::user()->user_type==1){
            return redirect('admin/dashbaord');
        }else if(Auth::user()->user_type==2){
            return redirect('teacher/dashbaord');
        }else if(Auth::user()->user_type==3){
            return redirect('student/dashbaord');
        }else if(Auth::user()->user_type==4){
            return redirect('parent/dashbaord');
        }
      
       }else{
        return redirect()->back()->with('error','please enter correct email and password');
       }
    }
    public function forgotpassword(){
        return view("auth.forgot");
    }
    public function PostForgotPassword(Request $request){
       $user=User::getEmailSingle($request->email);
       if(!empty($user)){
        // $user->password = Hash::make($request->password);
       }else{
        return redirect()->back()->with('error','Email not found in the system.');
       }
    }
    public function logout(){
        Auth::logout();
        return redirect(url(''));
    }
}
