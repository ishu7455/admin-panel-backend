<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NoteController extends Controller
{
    public function addMultiple(Request $request)
{
   // dd($request->input('notes'));
    $items = $request->input('notes');

    $responses = [];

    foreach ($items as $note) {
       // $title = $item['notes'];


        $doc = Note::create([
            'text' => $note,
            'applicant_id' => $request->applicant_id,
            'added_by' => Auth::user()->id
        ]);

        $responses[] = $doc;
    }

    return response()->json(['status' => 'success', 'updatedChecklists' => $responses]);
}

public function destroyCustomDoc($id)
{
    $doc = Note::find($id);

    if (!$doc) {
        return response()->json(['message' => 'Document not found'], 404);
    }

    $doc->delete();

    return response()->json(['message' => 'Document deleted successfully']);
}
}
