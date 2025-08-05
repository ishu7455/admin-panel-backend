<?php

namespace App\Http\Controllers;

use App\Models\AddCheckList;
use App\Models\CheckList;
use App\Models\CustomChecklist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckListController extends Controller
{
    public function getCustomChecklist($applicantId)
    {
        $doclists = CustomChecklist::where('applicant_id', $applicantId)->get();
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }

    public function toggleStatus(Request $request, $id)
{
    $checklist = CustomChecklist::findOrFail($id);
    $checklist->status = $request->status;
    $checklist->save();
     logHistory($checklist->applicant_id, 'Custom CheckList Status Update', null, null , $id);

    return response()->json(['message' => 'Status updated successfully']);
}

public function addMultiple(Request $request)
{
    $items = $request->input('items');
    $responses = [];

    foreach ($items as $index => $item) {
        $title = $item['title'];


        $doc = CustomChecklist::create([
            'title' => $title,
            'applicant_id' => $request->applicant_id,
            'added_by' => Auth::user()->id
        ]);
     logHistory($doc['applicant_id'], 'Custom CheckList Added', null, null , $doc['id']);
        $responses[] = $doc;
    }

    return response()->json(['status' => 'success', 'updatedChecklists' => $responses]);
}

public function destroyCustomDoc($id)
{
    $doc = CustomChecklist::find($id);

    if (!$doc) {
        return response()->json(['message' => 'Document not found'], 404);
    }

         logHistory($doc->applicant_id, 'Custom CheckList Deleted', null, null , $id);


    $doc->delete();

    return response()->json(['message' => 'Document deleted successfully']);
}
 public function getByCategory(Request $request , $categoryId)
    {
        $applicantId = $request->query('applicant_id');
        // $doclists = DocumentChecklist::where('category_id', $categoryId)->get();
        $doclists = CheckList::where('category_id', $categoryId)
        ->with(['docs' => function ($query) use ($applicantId) {
            $query->where('applicant_id', $applicantId);
        }])
        ->get();
                     //   ->orwhere('applicant_id', $applicantId)
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }

    public function UpdateChecklistStatus(Request $request)
{
   // return $request->all();
    $request->validate([
        'id' => 'required',
    ]);


   $docChecklist = AddCheckList::updateOrCreate(
    [
        'list_id' => $request->id,
        'applicant_id' => $request->applicantId,
    ],
    [
        'status' => $request->status,
    ]
);

    $docChecklist->list_id = $request->id;
    $docChecklist->applicant_id =  $request->applicantId;
    $docChecklist->update_by = Auth::user()->id;
    $docChecklist->status = $request->status;
    $docChecklist->save();

    logHistory(null , "Update Status");

    return response()->json([
        'message' => 'File uploaded successfully',
        'doc' => [
            'file_url' => $docChecklist->status,

        ],
    ]);
}
}
