

import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_alias_data.dart';
import 'item_stock_data.dart';
import 'item_trak_data.dart';

part 'item_lookup_response.g.dart';

@JsonSerializable()
class ItemLookupResponse {
  const ItemLookupResponse({
    this.error,
    this.message,
    this.itemAlias,
    this.itemStock,
    this.itemTrak,
  });

  factory ItemLookupResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemLookupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ItemLookupResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'itemAlias')
  final List<ItemAliasData>? itemAlias;

  @JsonKey(name: 'stock')
  final List<ItemStockData>? itemStock;

  @JsonKey(name: 'trak')
  final List<ItemTrakData>? itemTrak;
}
