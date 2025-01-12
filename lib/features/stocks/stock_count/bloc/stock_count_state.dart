import 'package:actiontrak_wh/application/models/stock_count/stock_count_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_count_state.freezed.dart';

@freezed
class StockCountState with _$StockCountState {
  factory StockCountState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String? errorMessage,
    @Default('') String? statusCode,
    List<StockCountData>? stockCount,
    @Default(false) bool didFinish,
  }) = _StockCountState;
}
