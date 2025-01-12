import 'package:actiontrak_wh/application/models/item_lookup/item_alias_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_stock_data.dart';
import 'package:actiontrak_wh/application/models/item_lookup/item_trak_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_lookup_state.freezed.dart';

@freezed
class ItemLookupState with _$ItemLookupState {
  factory ItemLookupState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String? errorMessage,
    @Default('') String? statusCode,
    @Default(false) bool isInit,
    @Default(false) bool isStockLoading,
    @Default(false) bool isTrakLoading,
    List<ItemAliasData>? itemAlias,
    List<ItemStockData>? itemStock,
    List<ItemTrakData>? itemTrak,
    @Default(false) bool didFinish,
  }) = _ItemLookupState;
}
