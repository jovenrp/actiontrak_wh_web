import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_count_data.g.dart';

@JsonSerializable()
class StockCountData {
  const StockCountData({
    this.id,
    this.status,
    this.num,
    this.containerId,
    this.type,
    this.comments,
    this.notes,
    this.isHold,
    this.createdById,
    this.fullName,
  });

  factory StockCountData.fromJson(Map<String, dynamic> json) =>
      _$StockCountDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockCountDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'num')
  final String? num;

  @JsonKey(name: 'containerId')
  final String? containerId;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'comments')
  final String? comments;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'isHold')
  final String? isHold;

  @JsonKey(name: 'createdById')
  final String? createdById;

  @JsonKey(name: 'fullName')
  final String? fullName;
}
