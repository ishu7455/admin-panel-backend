<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use App\Models\Category;
use App\Models\CustomDocumentChecklist;
use App\Models\DocumentChecklist;
use App\Models\HistoryLog;
use App\Models\UploadCheckList;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\helpers\helpers;



class FileController extends Controller
{
    public function storeOrUpdate(Request $request){

     $data = $request->all();

    $mainApplicant = $data[0];

    $subApplicants = array_slice($data, 1);
    $lastApplicant = Applicant::max('external_id');
    if(!isset($lastApplicant)){
       $lastApplicant = 101;
    }


            $data = [
            'external_id' => isset($mainApplicant['id']) ? $mainApplicant['external_id'] : $lastApplicant + 1,
            'program_subtype' =>  $mainApplicant['family_name'] ?? null,
            'family_name' => $mainApplicant['family_name'] ?? null,
            'given_name' => $mainApplicant['given_name'] ?? null,
            'phone_number' => $mainApplicant['phone_number'] ?? null,
            'email_id' => $mainApplicant['email_id'] ?? null,
            'date_of_birth' => $mainApplicant['date_of_birth'] ?? null,
            'gender' => $mainApplicant['gender'] ?? null,
            'marital_status' => $mainApplicant['marital_status'] ?? null,
            'address' => $mainApplicant['address'] ?? null,
            'number_of_applicants' => $mainApplicant['number_of_applicants'] ?? null,
            'country_of_residence' => $mainApplicant['country_of_residence'] ?? null,
            'country_of_citizenship' => $mainApplicant['country_of_citizenship'] ?? null,
            'status' => $mainApplicant['status'] ?? null,
            'spouse_name' => $mainApplicant['spouse_name'] ?? null,
            'spouse_dob' => $mainApplicant['spouse_dob'] ?? null,
            'have_children' => $mainApplicant['have_children'] ?? null,
            'children_details' => $mainApplicant['children_details'] ?? null,
            'applied_canada_visa' => $mainApplicant['applied_canada_visa'] ?? null,
            'applied_canada_visa_details' => $mainApplicant['applied_canada_visa_details'] ?? null,
            'refused_canada_visa' => $mainApplicant['refused_canada_visa'] ?? null,
            'refused_canada_visa_details' => $mainApplicant['refused_canada_visa_details'] ?? null,
            'refused_us_visa' => $mainApplicant['refused_us_visa'] ?? null,
            'refused_us_visa_details' => $mainApplicant['refused_us_visa_details'] ?? null,
            'interested_program' => $mainApplicant['interested_program'] ?? null,
            'edu_start_date' => $mainApplicant['edu_start_date'] ?? null,
            'edu_end_date' => $mainApplicant['edu_end_date'] ?? null,
            'edu_degree' => $mainApplicant['edu_degree'] ?? null,
            'edu_field' => $mainApplicant['edu_field'] ?? null,
            'emp_start_date' => $mainApplicant['emp_start_date'] ?? null,
            'emp_end_date' => $mainApplicant['emp_end_date'] ?? null,
            'designation' => $mainApplicant['designation'] ?? null,
            'emp_location' => $mainApplicant['emp_location'] ?? null,
            'company_name' => $mainApplicant['company_name'] ?? null,
            'net_worth' => $mainApplicant['net_worth'] ?? null,
            'property_value' => $mainApplicant['property_value'] ?? null,
            'income_source' => $mainApplicant['income_source'] ?? null,
            'listening_score' => $mainApplicant['listening_score'] ?? null,
            'reading_score' => $mainApplicant['reading_score'] ?? null,
            'writing_score' => $mainApplicant['writing_score'] ?? null,
            'speaking_score' => $mainApplicant['speaking_score'] ?? null,
            'test_type' => $mainApplicant['test_type'] ?? null,
            'test_date' => $mainApplicant['test_date'] ?? null,
            'spouse_edu_start_date' => $mainApplicant['spouse_edu_start_date'] ?? null,
            'spouse_edu_end_date' => $mainApplicant['spouse_edu_end_date'] ?? null,
            'spouse_edu_degree' => $mainApplicant['spouse_edu_degree'] ?? null,
            'spouse_edu_field' => $mainApplicant['spouse_edu_field'] ?? null,
            'spouse_emp_start_date' => $mainApplicant['spouse_emp_start_date'] ?? null,
            'spouse_emp_end_date' => $mainApplicant['spouse_emp_end_date'] ?? null,
            'spouse_designation' => $mainApplicant['spouse_designation'] ?? null,
            'spouse_location' => $mainApplicant['spouse_location'] ?? null,
            'spouse_company' => $mainApplicant['spouse_company'] ?? null,
            'spouse_net_worth' => $mainApplicant['spouse_net_worth'] ?? null,
            'spouse_income_source' => $mainApplicant['spouse_income_source'] ?? null,
            'spouse_property_value' => $mainApplicant['spouse_property_value'] ?? null,
            'spouse_listening_score' => $mainApplicant['spouse_listening_score'] ?? null,
            'spouse_reading_score' => $mainApplicant['spouse_reading_score'] ?? null,
            'spouse_writing_score' => $mainApplicant['spouse_writing_score'] ?? null,
            'spouse_speaking_score' => $mainApplicant['spouse_speaking_score'] ?? null,
            'spouse_test_type' => $mainApplicant['spouse_test_type'] ?? null,
            'spouse_test_date' => $mainApplicant['spouse_test_date'] ?? null,
            'have_connections' => $mainApplicant['have_connections'] ?? null,
            'friends_details' => $mainApplicant['friends_details'] ?? null,
           'family_details' => $mainApplicant['family_details'] ?? null,

            'other_legal_name'         => $mainApplicant['other_legal_name'] ?? null,
                'status_current_country'   => $mainApplicant['status_current_country'] ?? null,

                'other_country_stay' => json_encode([
                    'name'   => $mainApplicant['other_country_name'] ?? null,
                    'status' => $mainApplicant['other_country_status_1'] ?? null,
                    'other'  => $mainApplicant['other_country_other_1'] ?? null,
                    'from'   => $mainApplicant['other_country_from_1'] ?? null,
                    'to'     => $mainApplicant['other_country_to_1'] ?? null,
                ]),

                'previous_relationship' => json_encode([
                    'partner_name'      => $mainApplicant['previous_partner_name'] ?? null,
                    'relationship_type' => $mainApplicant['previous_relationship_type'] ?? null,
                    'start_date'        => $mainApplicant['previous_relationship_start_date'] ?? null,
                    'end_date'          => $mainApplicant['previous_relationship_end_date'] ?? null,
                ]),

                'inviter_details' => json_encode([
                    'name'         => $mainApplicant['inviter_name'] ?? null,
                    'address'      => $mainApplicant['inviter_address'] ?? null,
                    'relationship' => $mainApplicant['inviter_relationship'] ?? null,
                ]),

                'statutory_questions' => json_encode([
                    'q1'  => $mainApplicant['statutory_question_1'] ?? null,
                    'q2'  => $mainApplicant['statutory_question_2'] ?? null,
                    'q3'  => $mainApplicant['statutory_question_3'] ?? null,
                    'q4'  => $mainApplicant['statutory_question_4'] ?? null,
                    'q5'  => $mainApplicant['statutory_question_5'] ?? null,
                    'q6'  => $mainApplicant['statutory_question_6'] ?? null,
                    'q7'  => $mainApplicant['statutory_question_7'] ?? null,
                    'q8'  => $mainApplicant['statutory_question_8'] ?? null,
                    'q9'  => $mainApplicant['statutory_question_9'] ?? null,
                    'q10' => $mainApplicant['statutory_question_10'] ?? null,
                    'q11' => $mainApplicant['statutory_question_11'] ?? null,
                    'q12' => $mainApplicant['statutory_question_12'] ?? null,
                    'q13' => $mainApplicant['statutory_question_13'] ?? null,
                    'q14' => $mainApplicant['statutory_question_14'] ?? null,
                    'q15' => $mainApplicant['statutory_question_15'] ?? null,
                ]),

                'family_information' => json_encode([
                'mother' => [
                    'name'            => $mainApplicant['mother_name'] ?? null,
                    'marital_status'  => $mainApplicant['mother_marital_status'] ?? null,
                    'dob'              => $mainApplicant['mother_dob'] ?? null,
                    'city_birth'      => $mainApplicant['mother_city_birth'] ?? null,
                    'country_birth'   => $mainApplicant['mother_country_birth'] ?? null,
                    'present_address' => $mainApplicant['mother_present_address'] ?? null,
                ],
                'father' => [
                    'name'            => $mainApplicant['father_name'] ?? null,
                    'marital_status'  => $mainApplicant['father_marital_status'] ?? null,
                    'dob'              => $mainApplicant['father_dob'] ?? null,
                    'country_birth'   => $mainApplicant['father_country_birth'] ?? null,
                    'address'         => $mainApplicant['father_address'] ?? null,
                    'email'           => $mainApplicant['father_email'] ?? null,
                ],
                'child' => [
                    'name'            => $mainApplicant['child_name'] ?? null,
                    'marital_status'  => $mainApplicant['child_marital_status'] ?? null,
                    'dob'              => $mainApplicant['child_dob'] ?? null,
                    'country_birth'   => $mainApplicant['child_country_birth'] ?? null,
                    'present_address' => $mainApplicant['child_present_address'] ?? null,
                    'email'           => $mainApplicant['child_email'] ?? null,
                    'occupation'      => $mainApplicant['child_occupation'] ?? null,
                ]
            ]),

            'purpose_visit' => $mainApplicant['purpose_visit'] ?? null,
            'marriage_date' => $mainApplicant['marriage_date'] ?? null,
            'relationship_start_date' => $mainApplicant['relationship_start_date'] ?? null,
            ];
  $user = Auth::user();
if (in_array($user->role_id, [1, 2])) {
    $data['assign_by'] = $user->id;
    $data['assign_to'] = $mainApplicant['assign_to'] ?? null;
}

// Now create or update
$applicant = Applicant::updateOrCreate(
    ['id' => $mainApplicant['id'] ?? null],
    $data
);

// if(!empty($mainApplicant['id'])){
//    logHistory($mainApplicant['id'], 'File Updated' , null);
// }else{
//    logHistory($applicant['id'], 'File Added' , null);
// }
    // Handle Sub Applicants (create or update without deleting old)
    if (!empty($subApplicants)) {
        foreach ($subApplicants as $sub) {
                $lastSub = Applicant::max('external_id');
                if(!isset($lastSub)){
                  $lastSub = 101;
                }

            $subAppData = [
            'external_id' => isset($sub['id']) ? $sub['external_id'] : $lastSub + 1,
            'parent_id' => $applicant->id,
            'program_subtype' => $sub['program_subtype'] ?? null,
            'family_name' => $sub['family_name'] ?? null,
            'given_name' => $sub['given_name'] ?? null,
            'phone_number' => $sub['phone_number'] ?? null,
            'email_id' => $sub['email_id'] ?? null,
            'date_of_birth' => $sub['date_of_birth'] ?? null,
            'gender' => $sub['gender'] ?? null,
            'marital_status' => $sub['marital_status'] ?? null,
            'address' => $sub['address'] ?? null,
            'number_of_applicants' => $sub['number_of_applicants'] ?? null,
            'country_of_residence' => $sub['country_of_residence'] ?? null,
            'country_of_citizenship' => $sub['country_of_citizenship'] ?? null,
            'status' => $sub['status'] ?? null,
            'spouse_name' => $sub['spouse_name'] ?? null,
            'spouse_dob' => $sub['spouse_dob']?? null,
            'have_children' => $sub['have_children'] ?? null,
            'children_details' => $sub['children_details'] ?? null,
            'applied_canada_visa' => $sub['applied_canada_visa'] ?? null,
            'applied_canada_visa_details' => $sub['applied_canada_visa_details'] ?? null,
            'refused_canada_visa' => $sub['refused_canada_visa'] ?? null,
            'refused_canada_visa_details' => $sub['refused_canada_visa_details'] ?? null,
            'refused_us_visa' => $sub['refused_us_visa'] ?? null,
            'refused_us_visa_details' => $sub['refused_us_visa_details'] ?? null,
            'interested_program' => $sub['interested_program'] ?? null,
            'edu_start_date' => $sub['edu_start_date'] ?? null,
            'edu_end_date' => $sub['edu_end_date'] ?? null,
            'edu_degree' => $sub['edu_degree'] ?? null,
            'edu_field' => $sub['edu_field'] ?? null,
            'emp_start_date' => $sub['emp_start_date'] ?? null,
            'emp_end_date' => $sub['emp_end_date'] ?? null,
            'designation' => $sub['designation'] ?? null,
            'emp_location' => $sub['emp_location'] ?? null,
            'company_name' => $sub['company_name'] ?? null,
            'net_worth' => $sub['net_worth'] ?? null,
            'property_value' => $sub['property_value'] ?? null,
            'income_source' => $sub['income_source'] ?? null,
            'listening_score' => $sub['listening_score'] ?? null,
            'reading_score' => $sub['reading_score'] ?? null,
            'writing_score' => $sub['writing_score'] ?? null,
            'speaking_score' => $sub['speaking_score'] ?? null,
            'test_type' => $sub['test_type'] ?? null,
            'test_date' => $sub['test_date'] ?? null,
            'spouse_edu_start_date' => $sub['spouse_edu_start_date'] ?? null,
            'spouse_edu_end_date' => $sub['spouse_edu_end_date'] ?? null,
            'spouse_edu_degree' => $sub['spouse_edu_degree'] ?? null,
            'spouse_edu_field' => $sub['spouse_edu_field'] ?? null,
            'spouse_emp_start_date' => $sub['spouse_emp_start_date'] ?? null,
            'spouse_emp_end_date' => $sub['spouse_emp_end_date'] ?? null,
            'spouse_designation' => $sub['spouse_designation'] ?? null,
            'spouse_location' => $sub['spouse_location'] ?? null,
            'spouse_company' => $sub['spouse_company'] ?? null,
            'spouse_net_worth' => $sub['spouse_net_worth'] ?? null,
            'spouse_income_source' => $sub['spouse_income_source'] ?? null,
            'spouse_property_value' => $sub['spouse_property_value'] ?? null,
            'spouse_listening_score' => $sub['spouse_listening_score'] ?? null,
            'spouse_reading_score' => $sub['spouse_reading_score'] ?? null,
            'spouse_writing_score' => $sub['spouse_writing_score'] ?? null,
            'spouse_speaking_score' => $sub['spouse_speaking_score'] ?? null,
            'spouse_test_type' => $sub['spouse_test_type'] ?? null,
            'spouse_test_date' => $sub['spouse_test_date'] ?? null,
            'have_connections' => $sub['have_connections'] ?? null,
            'friends_details' => $sub['friends_details'] ?? null,
           'family_details' => $sub['family_details'] ?? null,


                'other_legal_name'         => $sub['other_legal_name'] ?? null,
                'status_current_country'   => $sub['status_current_country'] ?? null,

                'other_country_stay' => json_encode([
                    'name'   => $sub['other_country_name'] ?? null,
                    'status' => $sub['other_country_status_1'] ?? null,
                    'other'  => $sub['other_country_other_1'] ?? null,
                    'from'   => $sub['other_country_from_1'] ?? null,
                    'to'     => $sub['other_country_to_1'] ?? null,
                ]),

                'previous_relationship' => json_encode([
                    'partner_name'      => $sub['previous_partner_name'] ?? null,
                    'relationship_type' => $sub['previous_relationship_type'] ?? null,
                    'start_date'        => $sub['previous_relationship_start_date'] ?? null,
                    'end_date'          => $sub['previous_relationship_end_date'] ?? null,
                ]),

                'inviter_details' => json_encode([
                    'name'         => $sub['inviter_name'] ?? null,
                    'address'      => $sub['inviter_address'] ?? null,
                    'relationship' => $sub['inviter_relationship'] ?? null,
                ]),

                'statutory_questions' => json_encode([
                    'q1'  => $sub['statutory_question_1'] ?? null,
                    'q2'  => $sub['statutory_question_2'] ?? null,
                    'q3'  => $sub['statutory_question_3'] ?? null,
                    'q4'  => $sub['statutory_question_4'] ?? null,
                    'q5'  => $sub['statutory_question_5'] ?? null,
                    'q6'  => $sub['statutory_question_6'] ?? null,
                    'q7'  => $sub['statutory_question_7'] ?? null,
                    'q8'  => $sub['statutory_question_8'] ?? null,
                    'q9'  => $sub['statutory_question_9'] ?? null,
                    'q10' => $sub['statutory_question_10'] ?? null,
                    'q11' => $sub['statutory_question_11'] ?? null,
                    'q12' => $sub['statutory_question_12'] ?? null,
                    'q13' => $sub['statutory_question_13'] ?? null,
                    'q14' => $sub['statutory_question_14'] ?? null,
                    'q15' => $sub['statutory_question_15'] ?? null,
                ]),

                'family_information' => json_encode([
                'mother' => [
                    'name'            => $sub['mother_name'] ?? null,
                    'marital_status'  => $sub['mother_marital_status'] ?? null,
                    'dob'              => $sub['mother_dob'] ?? null,
                    'city_birth'      => $sub['mother_city_birth'] ?? null,
                    'country_birth'   => $sub['mother_country_birth'] ?? null,
                    'present_address' => $sub['mother_present_address'] ?? null,
                ],
                'father' => [
                    'name'            => $sub['father_name'] ?? null,
                    'marital_status'  => $sub['father_marital_status'] ?? null,
                    'dob'              => $sub['father_dob'] ?? null,
                    'country_birth'   => $sub['father_country_birth'] ?? null,
                    'address'         => $sub['father_address'] ?? null,
                    'email'           => $sub['father_email'] ?? null,
                ],
                'child' => [
                    'name'            => $sub['child_name'] ?? null,
                    'marital_status'  => $sub['child_marital_status'] ?? null,
                    'dob'              => $sub['child_dob'] ?? null,
                    'country_birth'   => $sub['child_country_birth'] ?? null,
                    'present_address' => $sub['child_present_address'] ?? null,
                    'email'           => $sub['child_email'] ?? null,
                    'occupation'      => $sub['child_occupation'] ?? null,
                ]
            ]),


            'purpose_visit' => $sub['purpose_visit'] ?? null,
            'marriage_date' => $sub['marriage_date'] ?? null,
            'relationship_start_date' => $sub['relationship_start_date'] ?? null,
            ];

           if (!empty($sub['id'])) {
    $subApplicant = Applicant::find($sub['id']);
    if ($subApplicant) {
        $subApplicant->fill($subAppData);
        $subApplicant->save(); // This will trigger auditing
    }
} else {
    Applicant::create($subAppData);
}

        }
    }
   // logHistory();

    return response()->json([
        'message' => $request->id ? 'File updated successfully' : 'File created successfully',
        'status' => 201
    ], 201);
    }

   public function getFile($id)
{
    $file = Applicant::with('docList')->where(['id' => $id])->orwhere(['parent_id' => $id])->get();

    return response()->json([
        'message' => 'File fetch successfully',
        'applicant' => $file,
        'status' => 200
    ]);
}

    public function getCategories(){
        $categories = Category::where('is_active',1)->get();
        return response()->json(['message' => 'Categories fetch successfully', 'categories' => $categories, 'status' => 200], 200);
    }

    public function getUsers(){
        $users = User::whereNotIn('role_id', [1, 2])->get();
        return response()->json(['message' => 'Categories fetch successfully', 'users' => $users, 'status' => 200], 200);
    }

    public function getByCategory(Request $request , $categoryId)
    {
        $applicantId = $request->query('applicant_id');
        // $doclists = DocumentChecklist::where('category_id', $categoryId)->get();
        $doclists = DocumentChecklist::where('category_id', $categoryId)
        ->with(['docs' => function ($query) use ($applicantId) {
            $query->where('applicant_id', $applicantId);
        },  'headings' => function ($query) use ($categoryId) {
                $query->where('category_id', $categoryId);
            }])
        ->get();
                     //   ->orwhere('applicant_id', $applicantId)
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }


public function upload(Request $request)
{
   // return $request->all();
    $request->validate([
        'file' => 'required|file',
        'id' => 'required',
    ]);

    $file = $request->file('file');
    $path = $file->store('uploads/checklists', 'public');

   $docChecklist = UploadCheckList::updateOrCreate(
    [
        'doc_id' => $request->id,
        'applicant_id' => $request->applicantId,
    ],
    [
        'upload_path' => $path,
    ]
);

    $docChecklist->upload_path = $path;
    $docChecklist->doc_id = $request->id;
    $docChecklist->applicant_id =  $request->applicantId;
    $docChecklist->upload_by = Auth::user()->id;

    $docChecklist->save();

    return response()->json([
        'message' => 'File uploaded successfully',
        'doc' => [
            'file_url' => $docChecklist->upload_path,
            'file_name' => $file,
             'id' => $docChecklist->id
        ],
    ]);
}

public function updateCustom(Request $request)
{
    $request->validate([
        'file' => 'required|file',
        'id' => 'required',
    ]);

    $file = $request->file('file');
    $path = $file->store('uploads/checklists', 'public');

  $doc = CustomDocumentChecklist::find($request->id);

if ($doc) {
    $doc->update(['upload_path' => $path]);

    logHistory($doc->applicant_id, 'Custom Document Updated', null, $request->id);
}

    return response()->json([
        'message' => 'File uploaded successfully',
        'doc' => [
            'file_url' => $path,
            'file_name' => $file,
        ],
    ]);
}
public function addMultiple(Request $request)
{
    $items = $request->input('items');
    $responses = [];

    foreach ($items as $index => $item) {
        $title = $item['title'];
        $file = $request->file("items.$index.file");

        $path = $file ? $file->store('uploads/checklists', 'public') : null;

        $doc = CustomDocumentChecklist::create([
            'title' => $title,
            'upload_path' => $path,
            'applicant_id' => $request->applicant_id,
            'upload_by' => Auth::user()->id
        ]);
       logHistory($doc['applicant_id'], 'Custom Document Added', null, $doc['id']);
        $responses[] = $doc;
    }

    return response()->json(['status' => 'success', 'updatedChecklists' => $responses]);
}

 public function getCustomChecklist($applicantId)
    {
        $doclists = CustomDocumentChecklist::where('applicant_id', $applicantId)->get();
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }

public function applicant(Request $request)
{
    $user = Auth::user();

    $query = Applicant::whereNull('parent_id')
        ->with(['subApplicants','assignToUser','assignByUser','program']);

   if ($search = $request->search) {
        $query->whereHas('assignToUser', function ($q) use ($search) {
            $q->where('first_name', 'like', "%$search%");
        })->orWhereHas('assignByUser', function ($q) use ($search) {
            $q->where('first_name', 'like', "%$search%");
        });
    }

    $perPage = $request->input('per_page', 10);
    $applicants = $query->paginate($perPage);

    return response()->json($applicants);
}


public function destroyCustomDoc($id)
{
    $doc = CustomDocumentChecklist::find($id);

    if (!$doc) {
        return response()->json(['message' => 'Document not found'], 404);
    }

    if ($doc->upload_path && Storage::disk('public')->exists($doc->upload_path)) {
        Storage::disk('public')->delete($doc->upload_path);
    }
   logHistory($doc->applicant_id, 'Custom Document Deleted', null, $id);
    $doc->delete();

    return response()->json(['message' => 'Document deleted successfully']);
}

public function download($id)
{
    $doc = CustomDocumentChecklist::find($id);

    if (!$doc || !$doc->upload_path ) {
        return response()->json([
            'status' => 'error',
            'message' => 'File not found.'
        ], 404);
    }

        return Storage::disk('public')->download($doc->upload_path);

}

public function downloadDoc($id)
{
    $doc = UploadCheckList::find($id);

    if (!$doc || !$doc->upload_path ) {
        return response()->json([
            'status' => 'error',
            'message' => 'File not found.'
        ], 404);
    }

        return Storage::disk('public')->download($doc->upload_path);

}
}

