<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Applicant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class Dashboard extends Controller
{
public function applicantStats(Request $request)
{

    $filter = $request->query('filter', 'month'); // default year
    $year = $request->query('year', now()->year);

    if ($filter === 'year') {
        $data = DB::table('applicants')
            ->select(DB::raw('YEAR(created_at) as label'), DB::raw('COUNT(*) as count'))
           ->orWhere('status',$request->status)
            ->groupBy('label')
            ->orderBy('label')
            ->get();
    } elseif ($filter === 'month') {
        $data = DB::table('applicants')
            ->select(DB::raw('MONTH(created_at) as label'), DB::raw('COUNT(*) as count'))
            ->whereYear('created_at', $year)
             ->orWhere('status',$request->status)
            ->groupBy('label')
            ->orderBy('label')
            ->get()
            ->map(function ($item) {
                $item->label = Carbon::create()->month($item->label)->format('M');
                return $item;
            });
    } elseif ($filter === 'week') {
        $data = DB::table('applicants')
            ->select(DB::raw('DAYNAME(created_at) as label'), DB::raw('COUNT(*) as count'))
            ->whereBetween('created_at', [
                now()->startOfWeek(), now()->endOfWeek()
            ])
            ->orWhere('status',$request->status)
            ->groupBy('label')
            ->orderByRaw("FIELD(label, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')")
            ->get();
    } else {
        return response()->json(['message' => 'Invalid filter'], 400);
    }

    return response()->json($data);
}

public function statusCount(){
    $data['total'] = Applicant::count();
    $data['totalNew'] = Applicant::where('status','New')->count();
    $data['totalInProcess'] = Applicant::where('status','In Process')->count();
    $data['totalFinalReview'] = Applicant::where('status','Final Review')->count();
    $data['totalCompleted'] = Applicant::where('status','Completed')->count();
    $data['totalPendingDocumentRequest'] = Applicant::where('status','Pending Document Request')->count();
    return response()->json($data);
}
}
