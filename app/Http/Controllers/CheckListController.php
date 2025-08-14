<?php

namespace App\Http\Controllers;

use App\Models\AddCheckList;
use App\Models\Category;
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

        // logHistory($doc->applicant_id, 'Custom CheckList Deleted', null, null , $id);
        $doc->update([
        'delete_status' => 0,
        'title' => $doc->title,
        'added_by' => Auth::user()->id
    ]);

   // $doc->delete();

    return response()->json(['message' => 'Document deleted successfully']);
}
 public function getByCategory(Request $request , $categoryId)
    {
        $applicantId = $request->query('applicant_id');
        // $doclists = DocumentChecklist::where('category_id', $categoryId)->get();
         $doclists = CheckList::where('category_id', $categoryId)
        ->with([
            'docs' => function ($query) use ($applicantId) {
                $query->where('applicant_id', $applicantId);
            },
            'headings' => function ($query) use ($categoryId) {
                $query->where('category_id', $categoryId);
            }
        ])
        ->get();

        $cat = Category::where('id',$categoryId)->value('name');
                     //   ->orwhere('applicant_id', $applicantId)
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'cat' => $cat ,'status' => 200], 200);

    }

   public function UpdateChecklistStatus(Request $request)
{
    $request->validate([
        'id'          => 'required|integer',
        'status'      => 'required|string',
        'applicantId' => 'nullable|integer',
    ]);

    $docChecklist = AddCheckList::updateOrCreate(
        [
            'list_id'      => $request->id,
            'applicant_id' => $request->applicantId,
        ],
        [
            'status'     => $request->status,
            'update_by'  => Auth::id(),
        ]
    );

    logHistory(null, "Update Status");

    return response()->json([
        'message' => 'Checklist status updated successfully',
        'doc' => [
            'status' => $docChecklist->status,
        ],
    ]);
}

}
