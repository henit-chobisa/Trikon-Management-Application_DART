import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikon_app/Classes/Product%20Class.dart';
import 'package:trikon_app/Home%20Screen/orderInformationGetter.dart';
import 'package:trikon_app/Home%20Screen/profilePage.dart';
import 'package:trikon_app/Widgets/trikonButton.dart';

class OrderCatalogPage extends StatefulWidget {
  OrderCatalogPage({required this.product});
  final Product product;
  @override
  _OrderCatalogPageState createState() => _OrderCatalogPageState();
}

class _OrderCatalogPageState extends State<OrderCatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(widget.product.imageURL),
                width: double.maxFinite,
                height: 600.h,
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 300.h),
                  child: Text(
                    widget.product.name.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        letterSpacing: 10),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.name.toUpperCase(),
                  style: TextStyle(fontSize: 20.sp, letterSpacing: 20),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "${widget.product.prize}",
                  style: TextStyle(fontSize: 48.sp, letterSpacing: 2),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TrikonButton(
                    tap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  informationGetter(order: widget.product)));
                    },
                    fillColor: Colors.white,
                    textColor: Colors.teal,
                    buttonTitle: "Order Now!"),
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
          )
        ],
      ),
    );
  }
}
