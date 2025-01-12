import 'package:freezed_annotation/freezed_annotation.dart';

import 'stock_count_data.dart';
part 'stock_count_response.g.dart';

@JsonSerializable()
class StockCountReponse {
  const StockCountReponse({
    this.error,
    this.message,
    this.stockCount,
  });

  factory StockCountReponse.fromJson(Map<String, dynamic> json) =>
      _$StockCountReponseFromJson(json);
  Map<String, dynamic> toJson() => _$StockCountReponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'countTickets')
  final List<StockCountData>? stockCount;
}
