import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class Individual {
  Individual(
      {required this.id,
      required this.Name,
      required this.Email,
      required this.BAddr,
      required this.SAddr,
      required this.Phone});

  // ignore: non_constant_identifier_names
  @JsonKey(name: '_id')
  String id;
  final String Name;
  final String Email;
  final String Phone;
  final String BAddr;
  final String SAddr;
  factory Individual.fromJson(Map<String, dynamic> json) =>
      _$IndividualFromJson(json);
  Map<String, dynamic> toJson() => _$IndividualToJson(this);
}
