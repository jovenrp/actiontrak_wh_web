import 'package:actiontrak_wh/application/models/stock_adjust/stock_adjust_data.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_item_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'stock_adjust_response.g.dart';

@JsonSerializable()
class StockAdjustResponse {
  const StockAdjustResponse({
    this.error,
    this.message,
    this.stockAdjust,
    this.stockItems,
  });

  factory StockAdjustResponse.fromJson(Map<String, dynamic> json) =>
      _$StockAdjustResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StockAdjustResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'stockAdjust')
  final List<StockAdjustData>? stockAdjust;

  @JsonKey(name: 'stock')
  final List<StockItemData>? stockItems;
}
