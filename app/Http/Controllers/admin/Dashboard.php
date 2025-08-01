<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Applicant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class Dashboard extends Controller
{
public function applicantStats()
{
    $filter = $request->query('filter', 'all');
    $now = Carbon::now();

    switch ($filter) {
        case 'weekly':
            $data = Applicant::select(DB::raw("WEEK(created_at, 1) as label"), DB::raw("count(*) as total"))
                ->whereMonth('created_at', $now->month)
                ->whereYear('created_at', $now->year)
                ->groupBy('label')
                ->orderBy('label')
                ->get();
            break;

        case 'monthly':
            $data = Applicant::select(DB::raw("MONTH(created_at) as label"), DB::raw("count(*) as total"))
                ->whereYear('created_at', $now->year)
                ->groupBy('label')
                ->orderBy('label')
                ->get();
            break;

        case 'yearly':
            $data = Applicant::select(DB::raw("YEAR(created_at) as label"), DB::raw("count(*) as total"))
                ->groupBy('label')
                ->orderBy('label')
                ->get();
            break;

        default:
            $data = Applicant::select(DB::raw("DATE(created_at) as label"), DB::raw("count(*) as total"))
                ->whereDate('created_at', $now->toDateString())
                ->groupBy('label')
                ->get();
            break;
    }

    return response()->json($data);
}

}
