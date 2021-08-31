import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:trikon_app/Classes/Order.dart';
import 'package:trikon_app/Widgets/trikonButton.dart';

class alterState extends StatefulWidget {
  alterState({required this.order, required this.property});
  final Order order;
  final String property;
  @override
  _alterStateState createState() => _alterStateState();
}

class _alterStateState extends State<alterState> {
  late bool internalDispatch;
  late bool internalDeliver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, bottom: 20.w, top: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      size: 30.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                  ),
                  Center(
                    child: Text(
                      'Order Info.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image(
                    image: AssetImage('images/brandLogo.png'),
                    height: 40.h,
                    width: 40.w,
                  ),
                ],
              ),
            ),
            Text(
              widget.order.Description,
              style: TextStyle(fontSize: 40.sp),
            ),
            Text(
              "Order ID : ${widget.order.id}",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Orderer : ${widget.order.user.Name}",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Text(
                "Do you want to change the status ${widget.property} to true ? ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TrikonButton(
                tap: () async {
                  if (widget.property == "delivered") {
                    var uri = Uri.parse("http://127.0.0.1:5000/updateOrder");
                    var body = {
                      '_id': widget.order.id,
                      'ordered': true,
                      'dispatched': true,
                      'delivered': true
                    };
                    var token =
                        await FirebaseAuth.instance.currentUser!.getIdToken();
                    var header = {
                      'Content-Type': "application/json",
                      'Authorization': "Bearer ${token}"
                    };
                    http
                        .post(uri, body: jsonEncode(body), headers: header)
                        .then((value) => {
                              print(value.body),
                              Navigator.pop(context),
                            });
                  } else {
                    var uri = Uri.parse("http://127.0.0.1:5000/updateOrder");
                    var body = {
                      '_id': widget.order.id,
                      'ordered': true,
                      'dispatched': true,
                      'delivered': false
                    };
                    var token =
                        await FirebaseAuth.instance.currentUser!.getIdToken();
                    var header = {
                      'Content-Type': "application/json",
                      'Authorization': "Bearer ${token}"
                    };
                    http
                        .post(uri, body: jsonEncode(body), headers: header)
                        .then((value) => {
                              print(value.body),
                              Navigator.pop(context),
                            });
                  }
                },
                fillColor: Colors.teal,
                textColor: Colors.white,
                buttonTitle: "Proceed"),
            SizedBox(
              height: 10.h,
            ),
            TrikonButton(
                tap: () {
                  Navigator.pop(context);
                },
                fillColor: Colors.white,
                textColor: Colors.teal,
                buttonTitle: "Abort"),
            Divider(
              height: 70.h,
              indent: 100,
              endIndent: 100,
              thickness: 2,
              color: Colors.grey,
            ),
            Center(
              child: Text(
                'Trikon Technologies 2021 | trikon.tech',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
