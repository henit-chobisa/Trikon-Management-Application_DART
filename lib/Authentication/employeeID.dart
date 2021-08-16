import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trikon_app/Authentication/loginPage.dart';
import 'package:trikon_app/Home%20Screen/homeLayout.dart';
import 'package:http/http.dart' as http;

class employeeID extends StatefulWidget {
  employeeID({this.accessToken});
  final accessToken;
  @override
  _employeeIDState createState() => _employeeIDState();
}

class _employeeIDState extends State<employeeID> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.h,
        ),
        Image(
          image: AssetImage("images/brandLogo.png"),
          height: 100,
          width: 100,
        ),
        SizedBox(
          height: 70.h,
        ),
        Center(
          child: Text(
            "Hello, ${(auth.currentUser!.displayName!)}!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.w300,
                fontFamily: "Roboto"),
          ),
        ),
        SizedBox(
          height: 150.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image(
            image: NetworkImage(auth.currentUser!.photoURL!),
            height: 100.h,
            width: 100.w,
          ),
        ),
        Spacer(),
        Center(
          child: Text(
            "We welcome you at Trikon!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: TrikonButton(
              tap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => homeLayout()));
              },
              fillColor: Colors.teal,
              textColor: Colors.white,
              buttonTitle: "Continue"),
        )
      ],
    ));
  }
}
