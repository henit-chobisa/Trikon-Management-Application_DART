import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Product%20Class.dart';
import 'package:trikon_app/Widgets/trikonButton.dart';
import 'package:trikon_app/Widgets/trikonTextFeild.dart';
import 'package:http/http.dart' as http;

class informationGetter extends StatefulWidget {
  informationGetter({required this.order});

  final Product order;
  @override
  _informationGetterState createState() => _informationGetterState();
}

class _informationGetterState extends State<informationGetter> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController bAddrController = TextEditingController();
  TextEditingController sAddrController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> placeOrder() async {
    Map<String, String> order = {
      "name": auth.currentUser!.displayName!,
      "email": auth.currentUser!.email!,
      "phone": phoneNumberController.text,
      "bAddr": bAddrController.text,
      "sAddr": sAddrController.text,
      "desc": widget.order.name,
      "qty": quantityController.text,
      "price": widget.order.prize,
      "weight": '20gms',
      "amount":
          "${int.parse(quantityController.text.toString()) * int.parse(widget.order.prize)}",
      "gst":
          "${0.1 * int.parse(quantityController.text.toString()) * int.parse(widget.order.prize)}",
      "total":
          "${1.1 * int.parse(quantityController.text.toString()) * int.parse(widget.order.prize)}",
      "date": DateTime.now().toString(),
    };
    var jsonOrder = jsonEncode(order);
    var token = await auth.currentUser!.getIdToken();
    var URL = Uri.parse("http://127.0.0.1:5000/createOrder");
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };
    var response = await http.post(URL, body: jsonOrder, headers: headers);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage('images/brandLogo.png'),
                height: 100.h,
                width: 100.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Center(
                  child: Text(
                "Enter your order information",
                style: TextStyle(
                    color: Colors.black, fontSize: 15.sp, fontFamily: "Futura"),
              )),
            ),
            Form(
                child: Column(
              children: [
                trikonTextFeild(
                  hiddenText: false,
                  inputType: TextInputType.number,
                  placeHolderText: 'Enter Quantity',
                  textEditingController: quantityController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                trikonTextFeild(
                    textEditingController: bAddrController,
                    placeHolderText: "Enter your 1st Address",
                    inputType: TextInputType.text,
                    hiddenText: false),
                SizedBox(
                  height: 10.h,
                ),
                trikonTextFeild(
                    textEditingController: sAddrController,
                    placeHolderText: "Enter your 2nd Address",
                    inputType: TextInputType.text,
                    hiddenText: false),
                SizedBox(
                  height: 10.h,
                ),
                trikonTextFeild(
                    textEditingController: phoneNumberController,
                    placeHolderText: "Enter your phone Number",
                    inputType: TextInputType.text,
                    hiddenText: false),
                SizedBox(
                  height: 30.h,
                ),
                TrikonButton(
                    tap: () async {
                      await placeOrder();
                      Navigator.pop(context);
                    },
                    fillColor: Colors.teal,
                    textColor: Colors.white,
                    buttonTitle: "Place Order!"),
                SizedBox(
                  height: 10.h,
                ),
                TrikonButton(
                    tap: () {
                      Navigator.pop(context);
                    },
                    fillColor: Colors.white,
                    textColor: Colors.teal,
                    buttonTitle: "Abort")
              ],
            ))
          ],
        ),
      ),
    );
  }
}
