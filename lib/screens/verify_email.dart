import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'login_screen.dart';
import 'enter_otp_screen.dart';

class VerifyEmail extends StatefulWidget {
  static const String id = 'VerifyEmail';
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  String confPassword;
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
              child: Text(
                'A One time Password or OTP is sent to your registered email. '
                'Please click on the link to verify your email and reset new password.',
                style: TextStyle(
                  color: Color(0xFF393E41).withOpacity(0.6),
                  fontSize: 15,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, EnterOTPScreen.id);
                  });
                },
                child: Text(
                  'Enter OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF393E41).withOpacity(0.8),
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, LoginScreen.id);
                });
              },
              child: Text(
                'Go to Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF393E41).withOpacity(0.8),
                  fontSize: 15,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
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
