import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Order.dart';
import 'package:trikon_app/Classes/User.dart';
import 'package:trikon_app/Widgets/OrderTile.dart';
import 'package:http/http.dart' as http;

class ordersPage extends StatefulWidget {
  const ordersPage({Key? key}) : super(key: key);
  @override
  _ordersPageState createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  List<Order> orderList = [];
  Future<void> getAllOrders() async {
    orderList = [];
    var url = Uri.parse("http://127.0.0.1:5000/getOrders");
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    var results = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    });
    List<dynamic> orders = jsonDecode(results.body);
    orders.forEach((element) {
      Order order = Order.fromJson(element);
      orderList.add(order);
    });
    orderList.sort((a, b) {
      return b.time.compareTo(a.time);
    });
  }

  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${FirebaseAuth.instance.currentUser!.displayName}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Futura",
                        ),
                      ),
                      Text(
                        "App Developer",
                        style: TextStyle(
                            fontSize: 13.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image(
                      image: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image(
                      image: AssetImage("images/brandLogo.png"),
                      height: 40.h,
                      width: 40.w,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                "Orders",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder(
              future: getAllOrders(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "Cooking Cooking...",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  );
                } else {
                  return Expanded(
                    child: Container(
                      height: double.maxFinite,
                      width: 400,
                      child: RefreshIndicator(
                        onRefresh: getAllOrders,
                        child: ListView.builder(
                            itemCount: orderList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (_, index) {
                              return OrderTile(
                                  order: orderList.elementAt(index));
                            }),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
