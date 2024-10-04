import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_tickets_data.g.dart';

@JsonSerializable()
class PickTicketsData {
  const PickTicketsData({
    this.status,
    this.id,
    this.destination,
    this.numLines,
    this.num,
    this.user,
    this.fullName,
  });

  factory PickTicketsData.fromJson(Map<String, dynamic> json) =>
      _$PickTicketsDataFromJson(json);
  Map<String, dynamic> toJson() => _$PickTicketsDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'num')
  final String? num;

  @JsonKey(name: 'destination')
  final String? destination;

  @JsonKey(name: 'numLines')
  final String? numLines;

  @JsonKey(name: 'user')
  final String? user;

  @JsonKey(name: 'fullName')
  final String? fullName;
}
