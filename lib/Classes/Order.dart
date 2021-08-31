import 'package:json_annotation/json_annotation.dart';

import 'User.dart';
part 'Order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  Order(
      {required this.time,
      required this.id,
      required this.user,
      required this.bAddr,
      required this.sAddr,
      required this.Description,
      required this.Weight,
      required this.Quantity,
      required this.Price,
      required this.Amount,
      required this.GST,
      required this.total,
      required this.Ordered,
      required this.dispatched,
      required this.delivered});

  @JsonKey(name: '_id')
  String id;
  DateTime time;
  final bool Ordered;
  final bool dispatched;
  final bool delivered;
  final Individual user;
  final String bAddr;
  final String sAddr;
  final String Description;
  final String Quantity;
  final String Price;
  final String Weight;
  final String Amount;
  final String GST;
  final String total;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
