import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marquee/marquee.dart';
import 'package:trikon_app/Classes/Product%20Class.dart';
import 'package:trikon_app/Home%20Screen/orders.dart';
import 'package:trikon_app/Home%20Screen/profilePage.dart';
import 'package:trikon_app/Home%20Screen/workPage.dart';
import 'package:trikon_app/Widgets/ProductTile.dart';

class homeLayout extends StatefulWidget {
  const homeLayout({Key? key}) : super(key: key);

  @override
  _homeLayoutState createState() => _homeLayoutState();
}

class _homeLayoutState extends State<homeLayout> {
  final tabs = [ordersPage(), workPage(), profilePage()];
  late var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              label: "Orders",
              icon: Icon(Icons.delivery_dining),
            ),
            BottomNavigationBarItem(
              label: "Work",
              icon: Icon(CupertinoIcons.command),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(CupertinoIcons.profile_circled),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: tabs[currentIndex]);
  }
}
