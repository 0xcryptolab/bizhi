import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'coin.freezed.dart';
part 'coin.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String name,
    required String logo,
    required double price,
    required double percentage24,
    required double balance,
    @Default([]) List<double> priceHistory,
    @Default([]) List<double> balanceHistory,
  }) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) =>
      _$CurrencyFromJson(json);
}
