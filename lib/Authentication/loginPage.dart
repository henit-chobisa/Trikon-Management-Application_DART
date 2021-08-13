import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Widgets/trikonTextFeild.dart';
import 'package:http/http.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  void requestLogin(String Username, String Password) async {
    var url = Uri.parse("http://127.0.0.1:5000/api/login");
    print(emailEditingController.text);
    var body = json.encode({
      "userName": emailEditingController.text.toString(),
      "password": passwordEditingController.text.toString()
    });

    Response r = await post(url,
        body: body, headers: {"Content-Type": "application/json"});
    print(r.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              trikonTextFeild(
                textEditingController: emailEditingController,
                placeHolderText: "Email Address, Please? ",
                inputType: TextInputType.emailAddress,
                hiddenText: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              trikonTextFeild(
                inputType: TextInputType.text,
                textEditingController: passwordEditingController,
                placeHolderText: "Your Password here...",
                hiddenText: true,
              ),
              Divider(
                endIndent: 100.w,
                indent: 100.w,
                color: Colors.grey,
                thickness: 2,
                height: 100,
              ),
              TrikonButton(
                tap: () {
                  requestLogin(emailEditingController.text,
                      passwordEditingController.text);
                },
                fillColor: Colors.teal.shade500,
                textColor: Colors.white,
                buttonTitle: "Log In",
              ),
              SizedBox(
                height: 15.h,
              ),
              TrikonButton(
                  tap: () {
                    print('ask for account');
                  },
                  fillColor: Colors.white,
                  textColor: Colors.teal.shade600,
                  buttonTitle: "Ask for Account"),
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Trikon Technologies 2021 | trikon.tech',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
