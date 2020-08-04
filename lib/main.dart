import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/get_started.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/verify_email.dart';
import 'screens/enter_otp_screen.dart';
import 'screens/reset_password_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GetStarted.id,
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          GetStarted.id: (context) => GetStarted(),
          ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
          VerifyEmail.id: (context) => VerifyEmail(),
          EnterOTPScreen.id: (context) => EnterOTPScreen(),
          ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
        });
  }
}
