<?php
namespace App\Models;

use OwenIt\Auditing\Models\Audit as OwenAudit;

class Audit extends OwenAudit
{
    public function users()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function auditable()
{
    return $this->morphTo();
}

}

