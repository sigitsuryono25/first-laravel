<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Welcome extends Controller
{
    function index(){
        //plain text
        return "Hai";
    }

    public function tampil()
    {
        $data['user'] = DB::table("user")->get();

        return view("form_select", $data);
    }

    public function delete($userid)
    {
        DB::table("user")->where("userid", $userid)->delete();

        return redirect('/tampil');
    }

    
}
