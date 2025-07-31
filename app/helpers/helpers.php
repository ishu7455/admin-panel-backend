<?php

use App\Models\HistoryLog;
use Illuminate\Support\Facades\Auth;

if (!function_exists('logHistory')) {
    function logHistory($applicantId, $message, $noteId=null , $customDocId=null, $customCheckId=null)
    {
        HistoryLog::create([
            'applicant_id' => $applicantId,
            'change_by' => Auth::id(),
            'note_id' => $noteId,
            'message' => $message,
            'custom_doc_id' => $customDocId,
            'custom_check_id' =>$customCheckId
        ]);
    }
}
