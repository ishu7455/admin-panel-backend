<?php

namespace App\Http\Controllers\Auth;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MicrosoftController extends Controller
{
    public function redirect()
    {
        return Socialite::driver('microsoft')->stateless()->redirect();
    }

   public function callback(Request $request)
    {
        if (!$request->has('code')) {
            return response()->json(['error' => 'Missing code'], 400);
        }

        try {
            $microsoftUser = Socialite::driver('microsoft')->stateless()->user();
        } catch (\Exception $e) {
            return response()->json(['error' => 'OAuth failed', 'message' => $e->getMessage()], 500);
        }

        $user = User::updateOrCreate(
            ['email' => $microsoftUser->getEmail()],
            [
                'name' => $microsoftUser->getName(),
                'password' => bcrypt(uniqid()),
                'avatar' => $microsoftUser->getAvatar(),
            ]
        );

        $token = $user->createToken('MicrosoftLogin')->accessToken;

        return redirect("http://localhost:3000/microsoft-success?token=$token");
    }
}
