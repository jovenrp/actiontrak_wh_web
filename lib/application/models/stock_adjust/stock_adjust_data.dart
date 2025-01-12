
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_adjust_data.g.dart';

@JsonSerializable()
class StockAdjustData {
  const StockAdjustData({
    this.qty,
    this.id,
  });

  factory StockAdjustData.fromJson(Map<String, dynamic> json) =>
      _$StockAdjustDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockAdjustDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'qty')
  final String? qty;
}
