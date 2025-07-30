<?php

use App\Models\HistoryLog;
use Illuminate\Support\Facades\Auth;

if (!function_exists('logHistory')) {
    function logHistory($applicantId, $message)
    {
        HistoryLog::create([
            'applicant_id' => $applicantId,
            'change_by' => Auth::id(),
            'message' => $message,
        ]);
    }
}
