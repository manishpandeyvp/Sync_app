import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'login_screen.dart';
import 'verify_email.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kEmailInputDecoration,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kPassInputDecoration,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  confPassword = value;
                },
                decoration: kPassConfInputDecoration,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: GestureDetector(
//                onTap: () async {
//                  setState(() {
//                    showSpinner = true;
//                  });
//                  try {
//                    final newUser = await _auth.createUserWithEmailAndPassword(
//                        email: email, password: password);
//                    await newUser.user.sendEmailVerification();
//                    if (await newUser.user.isEmailVerified) {
//                      Navigator.pushNamed(context, HomeScreen.id);
//                    }
//                    setState(() {
//                      showSpinner = false;
//                    });
//                  } catch (e) {
//                    print(e);
//                  }
//                },
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, VerifyEmail.id);
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
                      'Register',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Quicksnad'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You agree to all ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF393E41).withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'terms and conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF393E41),
                        fontSize: 14,
                        fontFamily: 'QuickSand',
                        fontWeight: FontWeight.w700),
                  ),
                ],
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
