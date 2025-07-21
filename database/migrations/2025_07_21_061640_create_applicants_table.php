<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('applicants', function (Blueprint $table) {
            $table->id();
            $table->string('external_id')->unique(); // user-defined ID
            $table->string('family_name')->nullable();
            $table->string('given_name')->nullable();
            $table->string('title')->nullable(); // Mr, Mrs, etc.
            $table->string('phone_number')->nullable();
            $table->string('email_id')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('gender')->nullable();
            $table->string('marital_status')->nullable();
            $table->text('address')->nullable();
            $table->integer('number_of_applicants')->nullable();
            $table->string('country_of_residence')->nullable();
            $table->string('country_of_citizenship')->nullable();
            $table->string('status')->nullable();

            // Section 2: Family Information
            $table->string('spouse_name')->nullable();
            $table->date('spouse_dob')->nullable();
            $table->boolean('have_children')->nullable();
            $table->text('children_details')->nullable();

            // Section 3: Immigration History
            $table->boolean('applied_canada_visa')->nullable();
            $table->text('applied_canada_visa_details')->nullable();
            $table->boolean('refused_canada_visa')->nullable();
            $table->text('refused_canada_visa_details')->nullable();
            $table->boolean('refused_us_visa')->nullable();
            $table->text('refused_us_visa_details')->nullable();

            // Section 4: Programs Interested
            $table->string('interested_program')->nullable();

            // Section 5: Educational History
            $table->date('edu_start_date')->nullable();
            $table->date('edu_end_date')->nullable();
            $table->string('edu_degree')->nullable();
            $table->string('edu_field')->nullable();

            // Section 6: Employment History
            $table->date('emp_start_date')->nullable();
            $table->date('emp_end_date')->nullable();
            $table->string('designation')->nullable();
            $table->string('emp_location')->nullable();
            $table->string('company_name')->nullable();

            // Section 7: Financial Information
            $table->string('net_worth')->nullable();
            $table->string('income_source')->nullable();
            $table->string('property_value')->nullable();

            // Section 8: Language Test Scores
            $table->integer('listening_score')->nullable();
            $table->integer('reading_score')->nullable();
            $table->integer('writing_score')->nullable();
            $table->integer('speaking_score')->nullable();
            $table->string('test_type')->nullable();
            $table->date('test_date')->nullable();

            // Section 9–12: Spouse Info (repeats of previous sections)
            $table->date('spouse_edu_start_date')->nullable();
            $table->date('spouse_edu_end_date')->nullable();
            $table->string('spouse_edu_degree')->nullable();
            $table->string('spouse_edu_field')->nullable();

            $table->date('spouse_emp_start_date')->nullable();
            $table->date('spouse_emp_end_date')->nullable();
            $table->string('spouse_designation')->nullable();
            $table->string('spouse_location')->nullable();
            $table->string('spouse_company')->nullable();

            $table->string('spouse_net_worth')->nullable();
            $table->string('spouse_income_source')->nullable();
            $table->string('spouse_property_value')->nullable();

            $table->integer('spouse_listening_score')->nullable();
            $table->integer('spouse_reading_score')->nullable();
            $table->integer('spouse_writing_score')->nullable();
            $table->integer('spouse_speaking_score')->nullable();
            $table->string('spouse_test_type')->nullable();
            $table->date('spouse_test_date')->nullable();

            // Section 13: Canadian Connections
            $table->boolean('have_connections')->nullable();
            $table->text('friends_details')->nullable();
            $table->text('family_details')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('applicants');
    }
};
