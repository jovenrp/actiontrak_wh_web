
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_trak_data.g.dart';

@JsonSerializable()
class ItemTrakData {
  const ItemTrakData({
    this.id,
    this.itemId,
    this.itemName,
    this.itemNum,
    this.qtyMin,
    this.qtyAlert,
    this.qtyMax,
    this.qtyCap,
    this.qtyDemand,
    this.containerId,
    this.containerCode,
    this.containerName,
    this.containerNum,
  });

  factory ItemTrakData.fromJson(Map<String, dynamic> json) =>
      _$ItemTrakDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemTrakDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'itemId')
  final String? itemId;

  @JsonKey(name: 'itemNum')
  final String? itemNum;

  @JsonKey(name: 'itemName')
  final String? itemName;

  @JsonKey(name: 'qtyMin')
  final String? qtyMin;

  @JsonKey(name: 'qtyAlert')
  final String? qtyAlert;

  @JsonKey(name: 'qtyMax')
  final String? qtyMax;

  @JsonKey(name: 'qtyCap')
  final String? qtyCap;

  @JsonKey(name: 'qtyDemand')
  final String? qtyDemand;

  @JsonKey(name: 'containerId')
  final String? containerId;

  @JsonKey(name: 'containerCode')
  final String? containerCode;

  @JsonKey(name: 'containerNum')
  final String? containerNum;

  @JsonKey(name: 'containerName')
  final String? containerName;
}
