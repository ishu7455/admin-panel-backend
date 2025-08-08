<?php

use App\Models\HistoryLog;
use Illuminate\Support\Facades\Auth;
use OwenIt\Auditing\Models\Audit;

if (!function_exists('logHistory')) {
    function logHistory($applicantId=null, $message=null, $noteId=null , $customDocId=null, $customCheckId=null)
    {

    $audit = \OwenIt\Auditing\Models\Audit::latest()->first();

if ($audit) {
    $old = $audit->old_values;
    $new = $audit->new_values;
    if($applicantId == null){
        $applicantId = $audit->auditable_id;
        $message = $audit->event;
    }
        HistoryLog::create([
            'applicant_id' => $applicantId,
            'change_by' => Auth::id(),
            'note_id' => $noteId,
            'message' => $message,
            'custom_doc_id' => $customDocId,
            'custom_check_id' =>$customCheckId,
            'old' => json_encode($old),
        'new' => json_encode($new),
        ]);
    }
}
}
