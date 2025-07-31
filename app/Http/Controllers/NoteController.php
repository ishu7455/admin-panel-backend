<?php

namespace App\Http\Controllers;

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
    $notes = Note::where('applicant_id', $request->applicant_id)->get();
    return response()->json(['status' => 'success','notes'=>$notes]);
}

public function update($id , Request $request)
{
    $note = Note::find($id);

    if (!$note) {
        return response()->json(['message' => 'Note not found'], 404);
    }

    Note::where('id',$id)->update(['text' => $request->note , 'added_by' => Auth::user()->id]);
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

public function history(Request $request){
    $history = HistoryLog::with('users')->where('applicant_id', $request->applicant_id)->get();

     $history = HistoryLog::with(['users','notes','customDoc','customCheck'])
        ->where('applicant_id', $request->applicant_id)
        ->get()
        ->map(function ($item) {
             $additionalId = null;
                if ($item->notes) {
                    $additionalId = $item->notes->id;
                } elseif ($item->customDoc) {
                    $additionalId = $item->customDoc->id;
                } elseif ($item->customCheck) {
                    $additionalId = $item->customCheck->id;
                }
            return [
                'id' => $item->id,
                'message' => $item->message,
                'created_at' => Carbon::parse($item->created_at)->format('d F, Y'),
                'in_days' => Carbon::parse($item->created_at)->diffForHumans() ?? null,
                'changed_by' => $item->users->first_name ?? null,
                'additional' => $additionalId ?? null
            ];
        });
    return response()->json(['status' => 'success','history'=>$history]);
}
}
