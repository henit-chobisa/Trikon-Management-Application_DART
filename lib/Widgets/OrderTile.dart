import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Order.dart';
import 'package:trikon_app/Classes/User.dart';
import 'package:trikon_app/Home%20Screen/OrderDescriptionPage.dart';
import 'package:http/http.dart' as http;

class OrderTile extends StatelessWidget {
  OrderTile({required this.order});
  final Order order;

  String status() {
    if (order.delivered == true) {
      return "Delivered";
    } else if (order.dispatched == true) {
      return "Dispatched";
    } else {
      return "Ordered";
    }
  }

  Future<void> updateOrder() async {
    final uri = Uri.parse("http://127.0.0.1:5000/updateOrder");
    var body = {
      '_id': order.id,
      'ordered': true,
      'dispatched': true,
      'delivered': false
    };
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    var response = http.post(uri, body: jsonEncode(body), headers: {
      "Content-Type": "application/json",
      'Authorization': "Bearer ${token}"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => orderDescription(order: order)));
        },
        child: Container(
          height: 180.h,
          width: 400.w,
          margin: EdgeInsets.only(bottom: 6.0.h),
          decoration: BoxDecoration(
            color: Colors.teal.shade300,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3.0, 5.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 180.h,
                width: 360.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, left: 20.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image(
                              image: AssetImage("images/narayan.jpg"),
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.user.Name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2.sp),
                              ),
                              Text(
                                order.user.Phone,
                                style: TextStyle(
                                    fontSize: 14.sp, letterSpacing: 2),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text(
                              "₹ ${order.Amount}",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 25.sp, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Container(
                          height: 2.h,
                          width: 115.w,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 15.w,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 2.h,
                          width: 100.w,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w800),
                            ),
                            Text(order.Description,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          color: Colors.black,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w800),
                            ),
                            Text(status(),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 170.h,
                  width: 40.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          "${order.time.day} - ${order.time.month} - ${order.time.year}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
