// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get percentage24 => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  List<double> get priceHistory => throw _privateConstructorUsedError;
  List<double> get balanceHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String name,
      String logo,
      double price,
      double percentage24,
      double balance,
      List<double> priceHistory,
      List<double> balanceHistory});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logo = null,
    Object? price = null,
    Object? percentage24 = null,
    Object? balance = null,
    Object? priceHistory = null,
    Object? balanceHistory = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      percentage24: null == percentage24
          ? _value.percentage24
          : percentage24 // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceHistory: null == priceHistory
          ? _value.priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<double>,
      balanceHistory: null == balanceHistory
          ? _value.balanceHistory
          : balanceHistory // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String logo,
      double price,
      double percentage24,
      double balance,
      List<double> priceHistory,
      List<double> balanceHistory});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logo = null,
    Object? price = null,
    Object? percentage24 = null,
    Object? balance = null,
    Object? priceHistory = null,
    Object? balanceHistory = null,
  }) {
    return _then(_$_Currency(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      percentage24: null == percentage24
          ? _value.percentage24
          : percentage24 // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceHistory: null == priceHistory
          ? _value._priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<double>,
      balanceHistory: null == balanceHistory
          ? _value._balanceHistory
          : balanceHistory // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Currency with DiagnosticableTreeMixin implements _Currency {
  const _$_Currency(
      {required this.name,
      required this.logo,
      required this.price,
      required this.percentage24,
      required this.balance,
      final List<double> priceHistory = const [],
      final List<double> balanceHistory = const []})
      : _priceHistory = priceHistory,
        _balanceHistory = balanceHistory;

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  final String name;
  @override
  final String logo;
  @override
  final double price;
  @override
  final double percentage24;
  @override
  final double balance;
  final List<double> _priceHistory;
  @override
  @JsonKey()
  List<double> get priceHistory {
    if (_priceHistory is EqualUnmodifiableListView) return _priceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceHistory);
  }

  final List<double> _balanceHistory;
  @override
  @JsonKey()
  List<double> get balanceHistory {
    if (_balanceHistory is EqualUnmodifiableListView) return _balanceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balanceHistory);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Currency(name: $name, logo: $logo, price: $price, percentage24: $percentage24, balance: $balance, priceHistory: $priceHistory, balanceHistory: $balanceHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Currency'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('percentage24', percentage24))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('priceHistory', priceHistory))
      ..add(DiagnosticsProperty('balanceHistory', balanceHistory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.percentage24, percentage24) ||
                other.percentage24 == percentage24) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality()
                .equals(other._priceHistory, _priceHistory) &&
            const DeepCollectionEquality()
                .equals(other._balanceHistory, _balanceHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      logo,
      price,
      percentage24,
      balance,
      const DeepCollectionEquality().hash(_priceHistory),
      const DeepCollectionEquality().hash(_balanceHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String name,
      required final String logo,
      required final double price,
      required final double percentage24,
      required final double balance,
      final List<double> priceHistory,
      final List<double> balanceHistory}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  String get name;
  @override
  String get logo;
  @override
  double get price;
  @override
  double get percentage24;
  @override
  double get balance;
  @override
  List<double> get priceHistory;
  @override
  List<double> get balanceHistory;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}
