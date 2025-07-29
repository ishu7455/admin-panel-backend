<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckList extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function docs(){
        return $this->hasMany(AddCheckList::class,'list_id');
    }


}
