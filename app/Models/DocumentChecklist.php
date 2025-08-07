<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentChecklist extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function docs(){
        return $this->hasMany(UploadCheckList::class,'doc_id');
    }

     public function headings(){
        return $this->hasMany(DocumentHeading::class,'id','heading_id');
    }

}
