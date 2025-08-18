<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Applicant;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class Dashboard extends Controller
{
public function applicantStats(Request $request)
{
    $filter = $request->query('filter', 'month');
    $year   = $request->query('year', now()->year);

    $query = DB::table('applicants');

    if ($filter === 'year') {
        $query->select(
                DB::raw('YEAR(created_at) as label'),
                DB::raw('COUNT(*) as count')
            )
            ->groupBy('label')
            ->orderBy('label');
    } elseif ($filter === 'month') {
        $query->select(
                DB::raw('MONTH(created_at) as label'),
                DB::raw('COUNT(*) as count')
            )
            ->whereYear('created_at', $year)
            ->groupBy('label')
            ->orderBy('label');
    } elseif ($filter === 'week') {
        $query->select(
                DB::raw('DAYNAME(created_at) as label'),
                DB::raw('COUNT(*) as count')
            )
            ->whereBetween('created_at', [
                now()->startOfWeek(), now()->endOfWeek()
            ])
            ->groupBy('label')
            ->orderByRaw("FIELD(label, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')");
    } else {
        return response()->json(['message' => 'Invalid filter'], 400);
    }

    // ✅ Dynamic filters
    $query->when($request->status, function ($q, $status) {
        $q->where('status', $status);
    });

    $query->when($request->assign_to, function ($q, $assignTo) {
        $q->where('assign_to', $assignTo);
    });

    $data = $query->get();

    // ✅ Month format fix
    if ($filter === 'month') {
        $data = $data->map(function ($item) {
            $item->label = \Carbon\Carbon::create()->month($item->label)->format('M');
            return $item;
        });
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
    $data['totalOnHold'] = Applicant::where('status','On Hold')->count();
    return response()->json($data);
}

public function updateStatus($status , $id){
    $findStatus = Applicant::find($id);
    $findStatus->update(['status' => $status]);
    //return response()->json($data);
}

public function updateAssigness($assignee , $id){
    $findStatus = Applicant::find($id);
    $findUser = User::where('id',$assignee)->value('first_name');
    $findStatus->update(['assign_to' => $assignee]);
    return response()->json($findUser);
}

}
