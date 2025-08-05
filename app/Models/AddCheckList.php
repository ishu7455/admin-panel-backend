<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;


class AddCheckList extends Model implements Auditable
{
    use HasFactory;
     use \OwenIt\Auditing\Auditable;
      protected $auditExclude = ['updated_at'];
    protected $guarded = ['id'];
}
