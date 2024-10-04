
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_tickets_data.g.dart';

@JsonSerializable()
class ShipTicketsData {
  const ShipTicketsData({
    this.id,
    this.userId,
    this.fullName,
    this.num,
    this.type,
    this.numLines,
    this.status,
    this.poId,
    this.isPartial,
    this.isComplete,
    this.vendorId,
    this.vendorName,
  });

  factory ShipTicketsData.fromJson(Map<String, dynamic> json) =>
      _$ShipTicketsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ShipTicketsDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'userId')
  final String? userId;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'num')
  final String? num;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'numLines')
  final String? numLines;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'poId')
  final String? poId;

  @JsonKey(name: 'isPartial')
  final String? isPartial;

  @JsonKey(name: 'isComplete')
  final String? isComplete;

  @JsonKey(name: 'vendorId')
  final String? vendorId;

  @JsonKey(name: 'vendorName')
  final String? vendorName;
}
