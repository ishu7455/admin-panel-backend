<?php

// app/Http/Controllers/Auth/MicrosoftController.php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Http\Request;

class MicrosoftController extends Controller
{
    public function redirect()
    {
        // return Socialite::driver('microsoft')
        //     ->with(['tenant' => config('services.microsoft.tenant')])
        //     ->stateless()
        //     ->redirect();

        // Simulated static login
    $user = User::where('email', 'bifot@mailinator.com')->first();

    if (!$user) {
        return response()->json([
            'error' => 'User not found'
        ], 404);
    }

    Auth::login($user);

    $tokenResult = $user->createToken('Microsoft-Login');
    $token = $tokenResult->accessToken;

    return response()->json([
        'token' => $token,
        'user' => $user
    ]);
    }

    public function callback(Request $request)
    {
        if (!$request->has('code')) {
            return response()->json(['error' => 'Missing code'], 400);
        }

        try {
            $microsoftUser = Socialite::driver('microsoft')
                ->with(['tenant' => config('services.microsoft.tenant')])
                ->stateless()
                ->user();
        } catch (\Exception $e) {
            return response()->json(['error' => 'OAuth failed', 'message' => $e->getMessage()], 500);
        }
       //  return $microsoftUser;
     //  dd($microsoftUser);

        $user = User::updateOrCreate(
            ['email' => $microsoftUser->getEmail()],
            [
                'first_name' => $microsoftUser->getName(),
             //   'password' => bcrypt(uniqid()), // Random fallback
                'image' => $microsoftUser->getAvatar(),
                'role_id' => 2
            ]
        );

        $token = $user->createToken('MicrosoftLogin')->accessToken;
        dd($token);

        return redirect("http://localhost:5173/microsoft-success?token=$token");
    }
}
