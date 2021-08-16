import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        height: 180.h,
        width: 400.w,
        margin: const EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          color: Colors.teal,
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
                  color: Colors.white70,
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
                            image: AssetImage("images/robovitics.jpg"),
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
                              "VistaPrint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.sp),
                            ),
                            Text(
                              "9508490248",
                              style: TextStyle(fontSize: 14, letterSpacing: 2),
                            )
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "4000₹",
                          style: TextStyle(fontSize: 25.sp),
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
                        width: 110.w,
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
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("Panda Toy",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))
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
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("Ordered",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))
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
                width: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "20th January",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
