import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Authentication/employeeID.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TrikonButton extends StatelessWidget {
  TrikonButton(
      {@required this.tap,
      required this.fillColor,
      required this.textColor,
      required this.buttonTitle});

  final tap;
  final Color fillColor;
  final Color textColor;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 365.w,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal.shade500, width: 2),
          color: fillColor,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
