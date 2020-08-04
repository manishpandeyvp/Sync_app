import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'login_screen.dart';
import 'reset_password_screen.dart';

class EnterOTPScreen extends StatefulWidget {
  static const String id = 'EnterOTPScreen';
  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Image(
              image: AssetImage('assets/Logo.png'),
              width: size.width * 0.25,
              height: size.height * 0.25,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kEnterOTPInputDecoration,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, ResetPasswordScreen.id);
                  });
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFEF5A53),
                          Color(0xFFF48348),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Quicksnad'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, LoginScreen.id);
                  });
                },
                child: Text(
                  'Already have an account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF393E41).withOpacity(0.8),
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
//            RoundedButton(
//              title: 'Reset',
//              color: Colors.blueAccent,
//              onPressed: () async {
//                setState(() {
//                  showSpinner = true;
//                });
//                try {
//                  await _auth.sendPasswordResetEmail(email: email);
//                  setState(() {
//                    showSpinner = false;
//                  });
//                } catch (e) {
//                  print(e);
//                }
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
