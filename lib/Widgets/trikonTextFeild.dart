import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class trikonTextFeild extends StatelessWidget {
  trikonTextFeild(
      {required this.textEditingController,
      required this.placeHolderText,
      required this.inputType,
      required this.hiddenText});

  final TextEditingController textEditingController;
  final String placeHolderText;
  final TextInputType inputType;
  final bool hiddenText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.teal, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          height: 70.h,
          width: 400.w,
          child: Center(
            child: TextField(
              obscureText: hiddenText,
              obscuringCharacter: "?",
              controller: textEditingController,
              textAlign: TextAlign.center,
              keyboardType: inputType,
              decoration: InputDecoration(
                  hintText: placeHolderText,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 17.sp),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 30.w, right: 10.w)),
            ),
          ),
        ),
      ),
    );
  }
}
