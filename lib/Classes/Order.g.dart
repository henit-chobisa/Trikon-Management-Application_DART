// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    time: DateTime.parse(json['date'].toString()),
    id: json['_id'] as String,
    user: Individual.fromJson(json['user'] as Map<String, dynamic>),
    bAddr: json['bAddr'] as String,
    sAddr: json['sAddr'] as String,
    Description: json['desc'] as String,
    Weight: json['weight'] as String,
    Quantity: json['qty'] as String,
    Price: json['price'] as String,
    Amount: json['amount'] as String,
    GST: json['gst'] as String,
    total: json['total'] as String,
    Ordered: json['ordered'] as bool,
    dispatched: json['dispatched'] as bool,
    delivered: json['delivered'] as bool,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      '_id': instance.id,
      'Ordered': instance.Ordered,
      'dispatched': instance.dispatched,
      'delivered': instance.delivered,
      'user': instance.user.toJson(),
      'bAddr': instance.bAddr,
      'sAddr': instance.sAddr,
      'Description': instance.Description,
      'Quantity': instance.Quantity,
      'Price': instance.Price,
      'Weight': instance.Weight,
      'Amount': instance.Amount,
      'GST': instance.GST,
      'total': instance.total,
    };
