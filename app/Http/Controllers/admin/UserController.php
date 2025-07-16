<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function getRoles()
    {
        $roles = Role::all();
        return response()->json(['message' => 'Roles fetch successfully', 'roles' => $roles, 'status' => 200], 200);
    }

    public function store(Request $request)
    {
    $validator = Validator::make($request->all(), [
        'first_name' => 'required|string|max:255',
        'last_name'  => 'required|string|max:255',
        'email'      => 'required|email|unique:users,email,' . $request->id,
        'role_id'    => 'required|exists:roles,id',
        'position'   => 'nullable|string|max:255',
        'image'      => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'message' => 'Validation failed',
            'errors' => $validator->errors(),
            'status' => 422
        ], 422);
    }

    $imagePath = null;

    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $uniqueName = Str::uuid() . '.' . $image->getClientOriginalExtension();
        $imagePath = $image->storeAs('uploads/users', $uniqueName, 'public');
    }

    $data = [
        'first_name' => $request->first_name,
        'last_name'  => $request->last_name,
        'email'      => $request->email,
        'role_id'    => $request->role_id,
        'position'   => $request->position,
    ];

    if ($imagePath) {
        $data['image'] = $imagePath;
    }

    $user = User::updateOrCreate(
        ['id' => $request->id],
        $data
    );

    return response()->json([
        'message' => $request->id ? 'User updated successfully' : 'User created successfully',
        'user' => $user,
        'status' => 201
    ], 201);
    }

    public function getUser($id)
    {
       $user = User::with('role')->find($id);
       return response()->json(['message' => 'User fetch successfully', 'user' => $user, 'status' => 200], 200);
    }

    public function index(Request $request)
    {
    $query = User::with('role');

    if ($request->has('search')) {
        $search = $request->search;
        $query->where('first_name', 'like', "%$search%")
              ->orWhere('last_name', 'like', "%$search%")
              ->orWhere('email', 'like', "%$search%");
    }

    $users = $query->paginate(10);

   return response()->json([
        'message'       => 'Users fetched successfully',
        'status'        => 200,
        'data'          => $users->items(),
        'current_page'  => $users->currentPage(),
        'last_page'     => $users->lastPage(),
        'per_page'      => $users->perPage(),
        'total'         => $users->total(),
        'from'          => $users->firstItem(),
        'to'            => $users->lastItem(),
    ]);
    }
}
