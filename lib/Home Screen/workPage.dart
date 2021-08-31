import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marquee/marquee.dart';
import 'package:trikon_app/Classes/Activity%20Class.dart';
import 'package:trikon_app/Classes/Product%20Class.dart';
import 'package:trikon_app/Home%20Screen/placeOrderPage.dart';
import 'package:trikon_app/Widgets/ProductTile.dart';
import 'package:trikon_app/Widgets/activity%20tile.dart';

class workPage extends StatefulWidget {
  const workPage({Key? key}) : super(key: key);

  @override
  _workPageState createState() => _workPageState();
}

class _workPageState extends State<workPage> {
  List<Product> products = [
    Product(name: "Aligners", imageURL: "images/1.jpg", prize: "300"),
    Product(name: "Panda Toy", imageURL: "images/2.jpg", prize: "200"),
    Product(name: "Castle", imageURL: "images/3.jpg", prize: "300"),
    Product(name: "Alien", imageURL: "images/4.jpg", prize: "200"),
    Product(name: "Lofi", imageURL: "images/5.jpg", prize: "500"),
    Product(name: "Hand", imageURL: "images/6.jpg", prize: "500"),
    Product(name: "Spider Man", imageURL: "images/7.jpg", prize: "500"),
    Product(name: "Owl", imageURL: "images/8.jpg", prize: "200"),
    Product(name: "Mahaveer", imageURL: "images/9.jpg", prize: "500"),
    Product(name: "Bull", imageURL: "images/10.jpg", prize: "500")
  ];

  List<Activity> activities = [
    Activity(
      person: "Henit Chobisa",
      time: "9:30 PM",
      message: "Completion of Internal Management Application",
      companyImageURL: AssetImage("images/brandLogo.png"),
      employImageURL:
          NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
    ),
    Activity(
      person: "R Narayan",
      time: "8:30 PM",
      message: "Completion of Backent API and database",
      companyImageURL: AssetImage("images/brandLogo.png"),
      employImageURL: AssetImage("images/narayan.jpg"),
    ),
    Activity(
      person: "Vinayak Dubey",
      time: "7:00 AM",
      message: "Robovitics order dispatched",
      companyImageURL: AssetImage("images/robovitics.jpg"),
      employImageURL: AssetImage("images/vinayak.jpg"),
    ),
    Activity(
      person: "Debopam Dey",
      time: "5:30 AM",
      message: "New order list has been assigned for Vistaprint order",
      companyImageURL: AssetImage("images/vistaPrint.jpg"),
      employImageURL: AssetImage("images/debopam.jpg"),
    ),
    Activity(
      person: "Ayush Bhushan",
      time: "9:30 AM",
      message: "New components has been shiped to team orcus",
      companyImageURL: AssetImage("images/orcus.jpg"),
      employImageURL: AssetImage("images/ayush.jpg"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Text(
              "Last Assigned Task",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50.h,
            width: double.maxFinite,
            child: Marquee(
              text: " Completion of trikon Application ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontFamily: "Futura",
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Divider(
            thickness: 2.h,
            endIndent: 150.w,
            indent: 150.w,
            color: Colors.teal,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Text(
              "Product Catalog",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 280.h,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OrderCatalogPage(
                                  product: products.elementAt(index))));
                    },
                    child: ProductCatlogTile(
                      product: products.elementAt(index),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Text(
              "Activity Today",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: activities.length,
              itemBuilder: (_, index) {
                return ActivityTile(activities.elementAt(index));
              },
            ),
          )
        ],
      ),
    );
  }
}
