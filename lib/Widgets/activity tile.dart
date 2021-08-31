import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Activity%20Class.dart';

class ActivityTile extends StatelessWidget {
  ActivityTile(this.activity);
  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.r, top: 10.h),
      child: Container(
        height: 100.h,
        width: 400.w,
        margin: const EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(3.0, 5.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 5.h),
              child: Row(
                children: [
                  Text(
                    activity.person,
                    style: TextStyle(color: Colors.teal.shade700),
                  ),
                  Spacer(),
                  Text(
                    activity.time,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    width: 30.w,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 25.w, right: 5.w),
                  child: Container(
                    width: 270.w,
                    child: Text(
                      activity.message,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image(
                    image: activity.companyImageURL,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image(
                    image: activity.employImageURL,
                    height: 30.h,
                    width: 30.w,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
