import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Widgets/OrderTile.dart';

class ordersPage extends StatefulWidget {
  const ordersPage({Key? key}) : super(key: key);

  @override
  _ordersPageState createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return OrderTile();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
