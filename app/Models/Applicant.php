<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;


class Applicant extends Model implements Auditable
{
    use HasFactory;
      use \OwenIt\Auditing\Auditable;
      protected $auditExclude = ['updated_at'];

    protected $guarded = ['id'];
     public function docList() {
        return $this->hasMany(DocumentChecklist::class);
    }

    public function subApplicants()
    {
      return $this->hasMany(Applicant::class, 'parent_id');
    }

    public function assignToUser() {
      return $this->belongsTo(User::class, 'assign_to');
    }
    public function assignByUser() {
      return $this->belongsTo(User::class, 'assign_by');
    }
    public function program() {
      return $this->belongsTo(Category::class, 'interested_program');
    }
}
