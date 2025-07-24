<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Applicant extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
     public function docList() {
        return $this->hasMany(DocumentChecklist::class);
    }

    public function subApplicants()
{
    return $this->hasMany(Applicant::class, 'parent_id');
}
}
