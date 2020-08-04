import 'package:flutter/material.dart';
import 'login_screen.dart';

class GetStarted extends StatefulWidget {
  static const String id = 'getStarted';

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            visibility = true;
          });
        },
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEF5A53),
              Color(0xFFF48348),
            ],
          )),
          child: Column(
            children: [
              Spacer(),
              Image(
                image: AssetImage(
                  'assets/sync-logo.png',
                ),
              ),
              Text(
                'Sync',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.09,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'the meeting app',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Spacer(),
              Visibility(
                visible: visibility,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Container(
                      height: 55,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32)),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Color(0xFF393E41),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
