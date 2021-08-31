import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Authentication/employeeID.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trikon_app/Widgets/trikonButton.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  void requestLogin() async {
    final user = await GoogleSignIn().signIn();
    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .whenComplete(() => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => employeeID(
                              accessToken: googleAuth.idToken,
                            )))
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage("images/brandLogo.png"),
                height: 100.h,
                width: 100.w,
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Text(
              "Consider the following points before logging in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "- This app is restricted within the boundries of trikon",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "- This app is built purely for trikon's internal and external management purposes",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "- For logging in, you need an authorization from the authorities",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "- Any type of milpractice with the app, can put you in serious trouble",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Thank You",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Trikon",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              endIndent: 100.w,
              indent: 100.w,
              color: Colors.grey,
              thickness: 2,
              height: 140.h,
            ),
            TrikonButton(
              tap: () {
                requestLogin();
              },
              fillColor: Colors.teal.shade500,
              textColor: Colors.white,
              buttonTitle: "Log In with Google",
            ),
            SizedBox(
              height: 15.h,
            ),
            TrikonButton(
                tap: () {
                  print('');
                },
                fillColor: Colors.white,
                textColor: Colors.teal.shade600,
                buttonTitle: "Request Authorization with server"),
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Trikon Technologies 2021 | trikon.tech',
              style: TextStyle(color: Colors.grey, fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }
}
