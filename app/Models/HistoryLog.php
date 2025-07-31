<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryLog extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function users(){
            return $this->belongsTo(User::class, 'change_by');

    }

     public function notes(){
            return $this->belongsTo(Note::class, 'note_id');

    }

     public function customDoc(){
            return $this->belongsTo(CustomDocumentChecklist::class, 'custom_doc_id');
    }

    public function customCheck(){
            return $this->belongsTo(CustomChecklist::class, 'custom_check_id');
    }

}
