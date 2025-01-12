import 'package:actiontrak_wh/application/models/item_lookup/item_lookup_response.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_adjust_data.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_adjust_response.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_item_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_adjust_state.freezed.dart';

@freezed
class StockAdjustState with _$StockAdjustState {
  factory StockAdjustState(
      {@Default(false) bool isLoading,
      @Default(false) bool isStockLoading,
      @Default(false) bool isAdjustLoading,
      @Default(false) bool hasError,
      @Default('') String? errorMessage,
      @Default('') String? statusCode,
      ItemLookupResponse? response,
      StockAdjustResponse? stockAdjustResponse,
      List<StockAdjustData>? stockAdjustData,
      List<StockItemData>? stockItems,
      @Default(false) bool didFinish,
      String? token}) = _StockAdjustState;
}
