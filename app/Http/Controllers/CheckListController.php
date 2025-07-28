<?php

namespace App\Http\Controllers;

use App\Models\CustomChecklist;
use Illuminate\Http\Request;

class CheckListController extends Controller
{
    public function getCustomChecklist($applicantId)
    {
        $doclists = CustomChecklist::where('applicant_id', $applicantId)->get();
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }
}
