<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;


class CheckList extends Model implements Auditable
{
    use HasFactory;
    protected $guarded = ['id'];
     use \OwenIt\Auditing\Auditable;
      protected $auditExclude = ['updated_at'];
    public function docs(){
        return $this->hasMany(AddCheckList::class,'list_id');
    }


}
