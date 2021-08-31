import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Product%20Class.dart';

class ProductCatlogTile extends StatelessWidget {
  ProductCatlogTile({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Container(
          height: 250.h,
          width: 180.w,
          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3.0, 10.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Opacity(
                  opacity: 0.8,
                  child: Image(
                    image: AssetImage(product.imageURL),
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Text(
                      product.name,
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    Text(
                      "₹ ${product.prize}",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
