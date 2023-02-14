// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      name: json['name'] as String,
      logo: json['logo'] as String,
      price: (json['price'] as num).toDouble(),
      percentage24: (json['percentage24'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      priceHistory: (json['priceHistory'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      balanceHistory: (json['balanceHistory'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'price': instance.price,
      'percentage24': instance.percentage24,
      'balance': instance.balance,
      'priceHistory': instance.priceHistory,
      'balanceHistory': instance.balanceHistory,
    };
