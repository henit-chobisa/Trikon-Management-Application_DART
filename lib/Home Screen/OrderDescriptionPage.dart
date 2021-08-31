import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trikon_app/Classes/Order.dart';
import 'package:trikon_app/Home%20Screen/OrderStatusAlter.dart';

class orderDescription extends StatefulWidget {
  orderDescription({required this.order});

  final Order order;
  @override
  _orderDescriptionState createState() => _orderDescriptionState();
}

class _orderDescriptionState extends State<orderDescription> {
  Color statusbgColor(bool status) {
    if (status == true) {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color statusTextColor(bool status) {
    if (status == true) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(fontSize: 20.sp),
                      ),
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
              Center(
                child: Text(
                  "${widget.order.Description}",
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  "Order ID : ${widget.order.id}",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Orderer : ${widget.order.user.Name}",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Divider(
                indent: 140.w,
                endIndent: 140.w,
                thickness: 1,
                height: 20.h,
                color: Colors.grey,
              ),
              Center(
                child: Container(
                  height: 140.h,
                  width: 400.w,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3.0, 5.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 25.h, bottom: 10.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                                Text(
                                  widget.order.Quantity,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 1.w,
                              height: 40.h,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                                Text(
                                  "₹${widget.order.Amount}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 1.w,
                              height: 40.h,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "GST",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                                Text(
                                  "₹${widget.order.GST}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 1.w,
                              height: 40.h,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                                Text(
                                  "₹${widget.order.total}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(
                          endIndent: 140.w,
                          indent: 140.w,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Text(
                          "View Invoice Details",
                          style: TextStyle(
                              color: Colors.teal.shade800, fontSize: 15.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 20.h,
                color: Colors.grey,
                indent: 100.w,
                endIndent: 100.w,
                thickness: 1,
              ),
              Center(
                child: Container(
                  height: 250.h,
                  width: 400.w,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3.0, 5.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 16.w, bottom: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delivery Information",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Phone Number : ${widget.order.user.Phone}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              letterSpacing: 2,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "BAddr : ${widget.order.bAddr}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              letterSpacing: 2,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "SAddr : ${widget.order.sAddr}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              letterSpacing: 2,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Time of Order : ${widget.order.time.day} - ${widget.order.time.month} - ${widget.order.time.day}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              letterSpacing: 2,
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          height: 30.h,
                          thickness: 1,
                          color: Colors.grey,
                          indent: 120.w,
                          endIndent: 120.w,
                        ),
                        Center(
                          child: Text(
                            'View Customer Details',
                            style: TextStyle(
                                color: Colors.teal.shade800, fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Current Status',
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.h,
                      width: 130.w,
                      margin: const EdgeInsets.only(bottom: 6.0),
                      decoration: BoxDecoration(
                        color: statusbgColor(widget.order.Ordered),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3.0, 5.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text(
                        "Ordered",
                        style: TextStyle(
                            color: statusTextColor(widget.order.Ordered),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 15.sp),
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!widget.order.dispatched) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => alterState(
                                        order: widget.order,
                                        property: "dispatched",
                                      )));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 130.w,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        decoration: BoxDecoration(
                          color: statusbgColor(widget.order.dispatched),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3.0, 5.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "Dispatched",
                          style: TextStyle(
                              color: statusTextColor(widget.order.dispatched),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 15.sp),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!widget.order.delivered) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => alterState(
                                        order: widget.order,
                                        property: "delivered",
                                      )));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 130.w,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        decoration: BoxDecoration(
                          color: statusbgColor(widget.order.delivered),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3.0.w, 5.0),
                              blurRadius: 6.0.r,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          "Delivered",
                          style: TextStyle(
                              color: statusTextColor(widget.order.delivered),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 15.sp),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 50.h,
                indent: 100.w,
                endIndent: 100.w,
                thickness: 2.h,
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
      ),
    );
  }
}
