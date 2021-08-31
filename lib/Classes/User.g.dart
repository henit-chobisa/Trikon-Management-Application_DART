// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Individual _$IndividualFromJson(Map<String, dynamic> json) {
  return Individual(
    id: json['_id'] as String,
    Name: json['name'] as String,
    Email: json['email'] as String,
    BAddr: json['bAddr'] as String,
    SAddr: json['sAddr'] as String,
    Phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$IndividualToJson(Individual instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'Name': instance.Name,
      'Email': instance.Email,
      'Phone': instance.Phone,
      'BAddr': instance.BAddr,
      'SAddr': instance.SAddr,
    };
