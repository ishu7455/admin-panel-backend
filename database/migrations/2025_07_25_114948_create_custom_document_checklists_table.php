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
        Schema::create('custom_document_checklists', function (Blueprint $table) {
            $table->id();
            $table->string('title');
             $table->unsignedBigInteger('applicant_id')->nullable();
             $table->unsignedBigInteger('upload_by')->nullable();
             $table->string('upload_path')->nullable();

            $table->foreign('upload_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('applicant_id')->references('id')->on('applicants')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('custom_document_checklists');
    }
};
