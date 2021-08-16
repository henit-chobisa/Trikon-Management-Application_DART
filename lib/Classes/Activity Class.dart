import 'package:flutter/cupertino.dart';

class Activity {
  Activity(
      {required this.person,
      required this.time,
      required this.message,
      required this.companyImageURL,
      required this.employImageURL});

  final String person;
  final String time;
  final String message;
  final ImageProvider companyImageURL;
  final ImageProvider employImageURL;
}
