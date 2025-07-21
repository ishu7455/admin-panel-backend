<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use App\Models\SubApplicant;
use Illuminate\Http\Request;

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

    //sub
    'sub_applicants' => 'nullable|array',
    'sub_applicants.*.family_name' => 'nullable|string|max:255',
    'sub_applicants.*.given_name' => 'nullable|string|max:255',
    'sub_applicants.*.title' => 'nullable|string|max:20', // e.g., Mr, Mrs
    'sub_applicants.*.phone_number' => 'nullable|string|max:20',
    'sub_applicants.*.email_id' => 'nullable|email|max:255',
    'sub_applicants.*.date_of_birth' => 'nullable|date',
    'sub_applicants.*.gender' => 'nullable|in:Male,Female,Other',
    'sub_applicants.*.marital_status' => 'nullable|in:Single,Married,Divorced,Widowed',
    'sub_applicants.*.address' => 'nullable|string',
    'sub_applicants.*.number_of_applicants' => 'nullable|integer|min:1',
    'sub_applicants.*.country_of_residence' => 'nullable|string|max:100',
    'sub_applicants.*.country_of_citizenship' => 'nullable|string|max:100',
    'sub_applicants.*.status' => 'nullable|string|max:100',

    // Section 2: Family Information
    'sub_applicants.*.spouse_name' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_dob' => 'nullable|date',
    'sub_applicants.*.have_children' => 'nullable|string',
    'sub_applicants.*.children_details' => 'nullable|string',

    // Section 3: Immigration History
    'sub_applicants.*.applied_canada_visa' => 'nullable|string',
    'sub_applicants.*.applied_canada_visa_details' => 'nullable|string',
    'sub_applicants.*.refused_canada_visa' => 'nullable|boolean',
    'sub_applicants.*.refused_canada_visa_details' => 'nullable|string',
    'sub_applicants.*.refused_us_visa' => 'nullable|boolean',
    'sub_applicants.*.refused_us_visa_details' => 'nullable|string',

    // Section 4: Program Interest
    'sub_applicants.*.interested_program' => 'nullable|string|max:255',

    // Section 5: Education
    'sub_applicants.*.edu_start_date' => 'nullable|date',
    'sub_applicants.*.edu_end_date' => 'nullable|date|after_or_equal:edu_start_date',
    'sub_applicants.*.edu_degree' => 'nullable|string|max:255',
    'sub_applicants.*.edu_field' => 'nullable|string|max:255',

    // Section 6: Employment
    'sub_applicants.*.emp_start_date' => 'nullable|date',
    'sub_applicants.*.emp_end_date' => 'nullable|date|after_or_equal:emp_start_date',
    'sub_applicants.*.designation' => 'nullable|string|max:255',
    'sub_applicants.*.emp_location' => 'nullable|string|max:255',
    'sub_applicants.*.company_name' => 'nullable|string|max:255',

    // Section 7: Financial Info
    'sub_applicants.*.net_worth' => 'nullable|string|max:255',
    'sub_applicants.*.income_source' => 'nullable|string|max:255',
    'sub_applicants.*.property_value' => 'nullable|string|max:255',

    // Section 8: Language Test Scores
    'sub_applicants.*.listening_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.reading_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.writing_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.speaking_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.test_type' => 'nullable|string|max:255',
    'sub_applicants.*.test_date' => 'nullable|date',

    // Spouse Education
    'sub_applicants.*.spouse_edu_start_date' => 'nullable|date',
    'sub_applicants.*.spouse_edu_end_date' => 'nullable|date|after_or_equal:spouse_edu_start_date',
    'sub_applicants.*.spouse_edu_degree' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_edu_field' => 'nullable|string|max:255',

    // Spouse Employment
    'sub_applicants.*.spouse_emp_start_date' => 'nullable|date',
    'sub_applicants.*.spouse_emp_end_date' => 'nullable|date|after_or_equal:spouse_emp_start_date',
    'sub_applicants.*.spouse_designation' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_location' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_company' => 'nullable|string|max:255',

    // Spouse Financial
    'sub_applicants.*.spouse_net_worth' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_income_source' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_property_value' => 'nullable|string|max:255',

    // Spouse Language Test
    'sub_applicants.*.spouse_listening_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.spouse_reading_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.spouse_writing_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.spouse_speaking_score' => 'nullable|integer|min:0|max:9',
    'sub_applicants.*.spouse_test_type' => 'nullable|string|max:255',
    'sub_applicants.*.spouse_test_date' => 'nullable|date',

    // Section 13: Canadian Connections
    'sub_applicants.*.have_connections' => 'nullable|boolean',
    'sub_applicants.*.friends_details' => 'nullable|string',
    'sub_applicants.*.family_details' => 'nullable|string',
    ]);

     $applicant = Applicant::updateOrCreate(
        ['id' => $request->id],  // if ID exists, update
        [
            'external_id' => 76788,
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

        ]
    );

    // Handle Sub Applicants (create or update without deleting old)
    if (!empty($subApplicants)) {
        foreach ($subApplicants as $sub) {
            $subAppData = [
                'applicant_id' => $applicant->id,
               'external_id' => '76678'.$sub['family_name'],
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
                // update existing sub applicant
                SubApplicant::where('id', $sub['id'])->update($subAppData);
            } else {
                // create new sub applicant
                SubApplicant::create($subAppData);
            }
        }
    }


    return response()->json([
        'message' => $request->id ? 'File updated successfully' : 'File created successfully',
        'status' => 201
    ], 201);
    }

    public function getFile($id){

       $file = Applicant::with('sub')->find($id);
       return response()->json(['message' => 'User fetch successfully', 'user' => $file, 'status' => 200], 200);
    }
}
