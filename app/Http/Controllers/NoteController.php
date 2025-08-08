<?php

namespace App\Http\Controllers;

use App\Models\Audit;
use App\Models\HistoryLog;
use App\Models\Note;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NoteController extends Controller
{
    public function addMultiple(Request $request)
{
    $items = $request->input('notes');

    $responses = [];

    foreach ($items as $note) {
        $doc = Note::create([
            'text' => $note,
            'applicant_id' => $request->applicant_id,
            'added_by' => Auth::user()->id
        ]);

        $responses[] = $doc;
        logHistory($request->applicant_id, 'Note Added' , $doc['id'] , null ,null);
    }

    return response()->json(['status' => 'success', 'updatedChecklists' => $responses]);
}

public function index(Request $request){
    $notes = Note::with('users')->where('applicant_id', $request->applicant_id)->get();
    return response()->json(['status' => 'success','notes'=>$notes]);
}

public function update($id , Request $request)
{
    $note = Note::find($id);

    if (!$note) {
        return response()->json(['message' => 'Note not found'], 404);
    }

     $note->update([
        'text' => $request->note,
        'added_by' => Auth::user()->id
    ]);
     logHistory($note['applicant_id'], 'Note Updated' , $note['id'] , null ,null);

    return response()->json(['status' => 'success','note'=>$note]);
}
public function destroy($id)
{
    $note = Note::find($id);

    if (!$note) {
        return response()->json(['message' => 'Document not found'], 404);
    }

    logHistory($note['applicant_id'], 'Note Deleted' , $note['id'] , null ,null);

    $note->delete();

    return response()->json(['message' => 'Document deleted successfully']);
}

// public function history(Request $request){
//     $history = HistoryLog::with('users')->where('applicant_id', $request->applicant_id)->get();

//      $history = HistoryLog::with(['users','notes','customDoc','customCheck'])
//         ->where('applicant_id', $request->applicant_id)
//         ->get()
//         ->map(function ($item) {
//              $additionalId = null;
//                 if ($item->notes) {
//                     $additionalId = $item->notes->id;
//                 } elseif ($item->customDoc) {
//                     $additionalId = $item->customDoc->id;
//                 } elseif ($item->customCheck) {
//                     $additionalId = $item->customCheck->id;
//                 }
//             return [
//                 'id' => $item->id,
//                 'message' => $item->message,
//                 'created_at' => Carbon::parse($item->created_at)->format('d F, Y'),
//                 'time' => Carbon::parse($item->created_at)->format('h:i A'),
//                 'in_days' => Carbon::parse($item->created_at)->diffForHumans() ?? null,
//                 'changed_by' => $item->users->first_name ?? null,
//                 'additional' => $additionalId ?? null,
//                 'old' => in_array($item->message, ['updated']) ? $item->old : null,
//                 'new' => in_array($item->message, ['updated']) ? $item->new : null,
//                 'new1' => in_array($item->message, ['Custom CheckList Added']) ?
//                          (json_decode($item->new)->title ?? null)  : null,


//             ];
//         });
//     return response()->json(['status' => 'success','history'=>$history]);
// }

public function history(Request $request)
{
    $applicantId = $request->applicant_id;

    $query = Audit::orderByDesc('created_at')->with(['user', 'auditable']);

    $query->where(function ($q) use ($applicantId) {
        // अगर खुद Applicant model है
        $q->where(function ($sub) use ($applicantId) {
            $sub->where('auditable_type', 'App\Models\Applicant')
                ->where('auditable_id', $applicantId);
        })
        // बाकी morph relations
        ->orWhereHasMorph(
            'auditable',
            [
                'App\Models\AddCheckList',
                'App\Models\CustomChecklist',
                'App\Models\CustomDocumentChecklist',
                'App\Models\Note',
                'App\Models\UploadCheckList',
            ],
            function ($morphQ) use ($applicantId) {
                $morphQ->where('applicant_id', $applicantId);
            }
        );
    });

    $history = $query->get()->map(function ($item) {
        $modelName = class_basename($item->auditable_type);
        $message = $modelName . ' ' . $item->event;

        if ($item->auditable) {
            $display = $item->auditable->title
                ?? $item->auditable->name
                ?? null;
            if($modelName == 'Note'){
            $mainText = "Note";
            }elseif($modelName == 'CustomChecklist'){
             $mainText = "Custom CheckList";
            }elseif($modelName == 'AddCheckList'){
             $mainText = "Check List";
            }elseif($modelName == 'UploadCheckList'){
             $mainText = "Doument";
            }elseif($modelName == 'CustomDocumentChecklist'){
             $mainText = "Custom Document Checklist";
            }

            if ($display) {
                $message = $mainText . ' (' . $display . ') ' . $item->event;
            }
        }

        return [
            'id'         => $item->id,
            'message'    => $message,
            'created_at' => $item->created_at->format('d F, Y'),
            'time'       => $item->created_at->format('h:i A'),
            'in_days'    => $item->created_at->diffForHumans(),
            'changed_by' => $item->user
                ? trim(($item->user->first_name ?? '') . ' ' . ($item->user->last_name ?? ''))
                : 'Unknown',
            'old'        => $item->event === 'updated' ? json_encode($item->old_values) : null,
            'new'        => $item->event === 'updated' ? json_encode($item->new_values) : null,
          //  'new1'       => $item->event === 'created'
              //  ? ($item->new_values['title'] ?? null)
              //  : null,
        ];
    });

    return response()->json([
        'status'  => 'success',
        'history' => $history
    ]);
}





}
