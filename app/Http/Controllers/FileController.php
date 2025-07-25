<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use App\Models\Category;
use App\Models\DocumentChecklist;
use App\Models\SubApplicant;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FileController extends Controller
{
    public function storeOrUpdate(Request $request){

     $data = $request->all();

    $mainApplicant = $data[0];

    $subApplicants = array_slice($data, 1);

    $validated = $request->validate([
    'family_name' => 'nullable|string|max:255',
    'given_name' => 'nullable|string|max:255',
    'phone_number' => 'nullable|string|max:20',
    'email_id' => 'nullable|email|max:255',
    'date_of_birth' => 'nullable|date',
    'gender' => 'nullable|in:Male,Female,Other',
    'marital_status' => 'nullable|in:Single,Married,Divorced,Widowed',
    'address' => 'nullable|string',
    'number_of_applicants' => 'nullable|integer|min:1',
    'country_of_residence' => 'nullable|string|max:100',
    'country_of_citizenship' => 'nullable|string|max:100',
    'status' => 'nullable|string|max:100',

    // Section 2: Family Information
    'spouse_name' => 'nullable|string|max:255',
    'spouse_dob' => 'nullable|date',
    'have_children' => 'nullable|string',
    'children_details' => 'nullable|string',

    // Section 3: Immigration History
    'applied_canada_visa' => 'nullable|string',
    'applied_canada_visa_details' => 'nullable|string',
    'refused_canada_visa' => 'nullable|boolean',
    'refused_canada_visa_details' => 'nullable|string',
    'refused_us_visa' => 'nullable|boolean',
    'refused_us_visa_details' => 'nullable|string',

    // Section 4: Program Interest
    'interested_program' => 'nullable|string|max:255',

    // Section 5: Education
    'edu_start_date' => 'nullable|date',
    'edu_end_date' => 'nullable|date|after_or_equal:edu_start_date',
    'edu_degree' => 'nullable|string|max:255',
    'edu_field' => 'nullable|string|max:255',

    // Section 6: Employment
    'emp_start_date' => 'nullable|date',
    'emp_end_date' => 'nullable|date|after_or_equal:emp_start_date',
    'designation' => 'nullable|string|max:255',
    'emp_location' => 'nullable|string|max:255',
    'company_name' => 'nullable|string|max:255',

    // Section 7: Financial Info
    'net_worth' => 'nullable|string|max:255',
    'income_source' => 'nullable|string|max:255',
    'property_value' => 'nullable|string|max:255',

    // Section 8: Language Test Scores
    'listening_score' => 'nullable|integer|min:0|max:9',
    'reading_score' => 'nullable|integer|min:0|max:9',
    'writing_score' => 'nullable|integer|min:0|max:9',
    'speaking_score' => 'nullable|integer|min:0|max:9',
    'test_type' => 'nullable|string|max:255',
    'test_date' => 'nullable|date',

    // Spouse Education
    'spouse_edu_start_date' => 'nullable|date',
    'spouse_edu_end_date' => 'nullable|date|after_or_equal:spouse_edu_start_date',
    'spouse_edu_degree' => 'nullable|string|max:255',
    'spouse_edu_field' => 'nullable|string|max:255',

    // Spouse Employment
    'spouse_emp_start_date' => 'nullable|date',
    'spouse_emp_end_date' => 'nullable|date|after_or_equal:spouse_emp_start_date',
    'spouse_designation' => 'nullable|string|max:255',
    'spouse_location' => 'nullable|string|max:255',
    'spouse_company' => 'nullable|string|max:255',

    // Spouse Financial
    'spouse_net_worth' => 'nullable|string|max:255',
    'spouse_income_source' => 'nullable|string|max:255',
    'spouse_property_value' => 'nullable|string|max:255',

    // Spouse Language Test
    'spouse_listening_score' => 'nullable|integer|min:0|max:9',
    'spouse_reading_score' => 'nullable|integer|min:0|max:9',
    'spouse_writing_score' => 'nullable|integer|min:0|max:9',
    'spouse_speaking_score' => 'nullable|integer|min:0|max:9',
    'spouse_test_type' => 'nullable|string|max:255',
    'spouse_test_date' => 'nullable|date',

    // Section 13: Canadian Connections
    'have_connections' => 'nullable|boolean',
    'friends_details' => 'nullable|string',
    'family_details' => 'nullable|string',


    ]);
    $lastApplicant = Applicant::max('external_id');
    if(!isset($lastApplicant)){
       $lastApplicant = 101;
    }


            $data = [
            'external_id' => isset($mainApplicant['id']) ? $mainApplicant['external_id'] : $lastApplicant + 1,
            'family_name' => $mainApplicant['family_name'],
            'given_name' => $mainApplicant['given_name'],
            'phone_number' => $mainApplicant['phone_number'],
            'email_id' => $mainApplicant['email_id'],
            'date_of_birth' => $mainApplicant['date_of_birth'],
            'gender' => $mainApplicant['gender'],
            'marital_status' => $mainApplicant['marital_status'],
            'address' => $mainApplicant['address'],
            'number_of_applicants' => $mainApplicant['number_of_applicants'],
            'country_of_residence' => $mainApplicant['country_of_residence'],
            'country_of_citizenship' => $mainApplicant['country_of_citizenship'],
            'status' => $mainApplicant['status'],
            'spouse_name' => $mainApplicant['spouse_name'],
            'spouse_dob' => $mainApplicant['spouse_dob'],
            'have_children' => $mainApplicant['have_children'],
            'children_details' => $mainApplicant['children_details'],
            'applied_canada_visa' => $mainApplicant['applied_canada_visa'],
            'applied_canada_visa_details' => $mainApplicant['applied_canada_visa_details'],
            'refused_canada_visa' => $mainApplicant['refused_canada_visa'],
            'refused_canada_visa_details' => $mainApplicant['refused_canada_visa_details'],
            'refused_us_visa' => $mainApplicant['refused_us_visa'],
            'refused_us_visa_details' => $mainApplicant['refused_us_visa_details'],
            'interested_program' => $mainApplicant['interested_program'],
            'edu_start_date' => $mainApplicant['edu_start_date'],
            'edu_end_date' => $mainApplicant['edu_end_date'],
            'edu_degree' => $mainApplicant['edu_degree'],
            'edu_field' => $mainApplicant['edu_field'],
            'emp_start_date' => $mainApplicant['emp_start_date'],
            'emp_end_date' => $mainApplicant['emp_end_date'],
            'designation' => $mainApplicant['designation'],
            'emp_location' => $mainApplicant['emp_location'],
            'company_name' => $mainApplicant['company_name'],
            'net_worth' => $mainApplicant['net_worth'],
            'property_value' => $mainApplicant['property_value'],
            'income_source' => $mainApplicant['income_source'],
            'listening_score' => $mainApplicant['listening_score'],
            'reading_score' => $mainApplicant['reading_score'],
            'writing_score' => $mainApplicant['writing_score'],
            'speaking_score' => $mainApplicant['speaking_score'],
            'test_type' => $mainApplicant['test_type'],
            'test_date' => $mainApplicant['test_date'],
            'spouse_edu_start_date' => $mainApplicant['spouse_edu_start_date'],
            'spouse_edu_end_date' => $mainApplicant['spouse_edu_end_date'],
            'spouse_edu_degree' => $mainApplicant['spouse_edu_degree'],
            'spouse_edu_field' => $mainApplicant['spouse_edu_field'],
            'spouse_emp_start_date' => $mainApplicant['spouse_emp_start_date'],
            'spouse_emp_end_date' => $mainApplicant['spouse_emp_end_date'],
            'spouse_designation' => $mainApplicant['spouse_designation'],
            'spouse_location' => $mainApplicant['spouse_location'],
            'spouse_company' => $mainApplicant['spouse_company'],
            'spouse_net_worth' => $mainApplicant['spouse_net_worth'],
            'spouse_income_source' => $mainApplicant['spouse_income_source'],
            'spouse_property_value' => $mainApplicant['spouse_property_value'],
            'spouse_listening_score' => $mainApplicant['spouse_listening_score'],
            'spouse_reading_score' => $mainApplicant['spouse_reading_score'],
            'spouse_writing_score' => $mainApplicant['spouse_writing_score'],
            'spouse_speaking_score' => $mainApplicant['spouse_speaking_score'],
            'spouse_test_type' => $mainApplicant['spouse_test_type'],
            'spouse_test_date' => $mainApplicant['spouse_test_date'],
            'have_connections' => $mainApplicant['have_connections'],
            'friends_details' => $mainApplicant['friends_details'],
           'family_details' => $mainApplicant['family_details'],
            ];
  $user = Auth::user();
if (in_array($user->role_id, [1, 2])) {
    $data['assign_by'] = $user->id;
    $data['assign_to'] = $mainApplicant['assign_to'];
}

// Now create or update
$applicant = Applicant::updateOrCreate(
    ['id' => $mainApplicant['id'] ?? null],
    $data
);
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
            'family_name' => $sub['family_name'],
            'given_name' => $sub['given_name'],
            'phone_number' => $sub['phone_number'],
            'email_id' => $sub['email_id'],
            'date_of_birth' => $sub['date_of_birth'],
            'gender' => $sub['gender'],
            'marital_status' => $sub['marital_status'],
            'address' => $sub['address'],
            'number_of_applicants' => $sub['number_of_applicants'],
            'country_of_residence' => $sub['country_of_residence'],
            'country_of_citizenship' => $sub['country_of_citizenship'],
            'status' => $sub['status'],
            'spouse_name' => $sub['spouse_name'],
            'spouse_dob' => $sub['spouse_dob'],
            'have_children' => $sub['have_children'],
            'children_details' => $sub['children_details'],
            'applied_canada_visa' => $sub['applied_canada_visa'],
            'applied_canada_visa_details' => $sub['applied_canada_visa_details'],
            'refused_canada_visa' => $sub['refused_canada_visa'],
            'refused_canada_visa_details' => $sub['refused_canada_visa_details'],
            'refused_us_visa' => $sub['refused_us_visa'],
            'refused_us_visa_details' => $sub['refused_us_visa_details'],
            'interested_program' => $sub['interested_program'],
            'edu_start_date' => $sub['edu_start_date'],
            'edu_end_date' => $sub['edu_end_date'],
            'edu_degree' => $sub['edu_degree'],
            'edu_field' => $sub['edu_field'],
            'emp_start_date' => $sub['emp_start_date'],
            'emp_end_date' => $sub['emp_end_date'],
            'designation' => $sub['designation'],
            'emp_location' => $sub['emp_location'],
            'company_name' => $sub['company_name'],
            'net_worth' => $sub['net_worth'],
            'property_value' => $sub['property_value'],
            'income_source' => $sub['income_source'],
            'listening_score' => $sub['listening_score'],
            'reading_score' => $sub['reading_score'],
            'writing_score' => $sub['writing_score'],
            'speaking_score' => $sub['speaking_score'],
            'test_type' => $sub['test_type'],
            'test_date' => $sub['test_date'],
            'spouse_edu_start_date' => $sub['spouse_edu_start_date'],
            'spouse_edu_end_date' => $sub['spouse_edu_end_date'],
            'spouse_edu_degree' => $sub['spouse_edu_degree'],
            'spouse_edu_field' => $sub['spouse_edu_field'],
            'spouse_emp_start_date' => $sub['spouse_emp_start_date'],
            'spouse_emp_end_date' => $sub['spouse_emp_end_date'],
            'spouse_designation' => $sub['spouse_designation'],
            'spouse_location' => $sub['spouse_location'],
            'spouse_company' => $sub['spouse_company'],
            'spouse_net_worth' => $sub['spouse_net_worth'],
            'spouse_income_source' => $sub['spouse_income_source'],
            'spouse_property_value' => $sub['spouse_property_value'],
            'spouse_listening_score' => $sub['spouse_listening_score'],
            'spouse_reading_score' => $sub['spouse_reading_score'],
            'spouse_writing_score' => $sub['spouse_writing_score'],
            'spouse_speaking_score' => $sub['spouse_speaking_score'],
            'spouse_test_type' => $sub['spouse_test_type'],
            'spouse_test_date' => $sub['spouse_test_date'],
            'have_connections' => $sub['have_connections'],
            'friends_details' => $sub['friends_details'],
           'family_details' => $sub['family_details'],
            ];

            if (!empty($sub['id'])) {
                Applicant::where('id', $sub['id'])->update($subAppData);
            } else {
                Applicant::create($subAppData);
            }
        }
    }


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
        $doclists = DocumentChecklist::where('category_id', $categoryId)
                        ->orwhere('applicant_id', $applicantId)
                        ->get();
        return response()->json(['message' => 'Checklist fetch successfully', 'doclists' => $doclists, 'status' => 200], 200);

    }


public function upload(Request $request)
{
    $request->validate([
        'file' => 'required|file',
        'id' => 'required',
    ]);

    $file = $request->file('file');
    $path = $file->store('uploads/checklists', 'public');

    $docChecklist = DocumentChecklist::findOrFail($request->id);
    $docChecklist->upload_path = $path;
    $docChecklist->save();

    return response()->json([
        'message' => 'File uploaded successfully',
        'doc' => [
            'file_url' => $docChecklist->upload_path,
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

        $doc = DocumentChecklist::create([
            'title' => $title,
            'upload_path' => $path,
            'applicant_id' => $request->applicant_id
        ]);

        $responses[] = $doc;
    }

    return response()->json(['status' => 'success', 'updatedChecklists' => $responses]);
}


public function applicant(){
    $user = Auth::user();

    if (in_array($user->role_id, [1, 2])) {
        $applicants = Applicant::whereNull('parent_id')
            ->with('subApplicants')
            ->get();
    } else {
        $applicants = Applicant::whereNull('parent_id')
            ->where('assign_to', $user->id)
            ->with('subApplicants')
            ->get();
    }

        return response()->json($applicants);
}

}

