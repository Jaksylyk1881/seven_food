// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryDetailDetails _$HistoryDetailDetailsFromJson(Map<String, dynamic> json) {
  return _HistoryDetail.fromJson(json);
}

/// @nodoc
class _$HistoryDetailDetailsTearOff {
  const _$HistoryDetailDetailsTearOff();

  _HistoryDetail call(
      {String? name, String? price, String? quantity, String? sum}) {
    return _HistoryDetail(
      name: name,
      price: price,
      quantity: quantity,
      sum: sum,
    );
  }

  HistoryDetailDetails fromJson(Map<String, Object?> json) {
    return HistoryDetailDetails.fromJson(json);
  }
}

/// @nodoc
const $HistoryDetailDetails = _$HistoryDetailDetailsTearOff();

/// @nodoc
mixin _$HistoryDetailDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  String? get sum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryDetailDetailsCopyWith<HistoryDetailDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDetailDetailsCopyWith<$Res> {
  factory $HistoryDetailDetailsCopyWith(HistoryDetailDetails value,
          $Res Function(HistoryDetailDetails) then) =
      _$HistoryDetailDetailsCopyWithImpl<$Res>;
  $Res call({String? name, String? price, String? quantity, String? sum});
}

/// @nodoc
class _$HistoryDetailDetailsCopyWithImpl<$Res>
    implements $HistoryDetailDetailsCopyWith<$Res> {
  _$HistoryDetailDetailsCopyWithImpl(this._value, this._then);

  final HistoryDetailDetails _value;
  // ignore: unused_field
  final $Res Function(HistoryDetailDetails) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? sum = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      sum: sum == freezed
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HistoryDetailCopyWith<$Res>
    implements $HistoryDetailDetailsCopyWith<$Res> {
  factory _$HistoryDetailCopyWith(
          _HistoryDetail value, $Res Function(_HistoryDetail) then) =
      __$HistoryDetailCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? price, String? quantity, String? sum});
}

/// @nodoc
class __$HistoryDetailCopyWithImpl<$Res>
    extends _$HistoryDetailDetailsCopyWithImpl<$Res>
    implements _$HistoryDetailCopyWith<$Res> {
  __$HistoryDetailCopyWithImpl(
      _HistoryDetail _value, $Res Function(_HistoryDetail) _then)
      : super(_value, (v) => _then(v as _HistoryDetail));

  @override
  _HistoryDetail get _value => super._value as _HistoryDetail;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? sum = freezed,
  }) {
    return _then(_HistoryDetail(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      sum: sum == freezed
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryDetail implements _HistoryDetail {
  _$_HistoryDetail({this.name, this.price, this.quantity, this.sum});

  factory _$_HistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryDetailFromJson(json);

  @override
  final String? name;
  @override
  final String? price;
  @override
  final String? quantity;
  @override
  final String? sum;

  @override
  String toString() {
    return 'HistoryDetailDetails(name: $name, price: $price, quantity: $quantity, sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryDetail &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.sum, sum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(sum));

  @JsonKey(ignore: true)
  @override
  _$HistoryDetailCopyWith<_HistoryDetail> get copyWith =>
      __$HistoryDetailCopyWithImpl<_HistoryDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryDetailToJson(this);
  }
}

abstract class _HistoryDetail implements HistoryDetailDetails {
  factory _HistoryDetail(
      {String? name,
      String? price,
      String? quantity,
      String? sum}) = _$_HistoryDetail;

  factory _HistoryDetail.fromJson(Map<String, dynamic> json) =
      _$_HistoryDetail.fromJson;

  @override
  String? get name;
  @override
  String? get price;
  @override
  String? get quantity;
  @override
  String? get sum;
  @override
  @JsonKey(ignore: true)
  _$HistoryDetailCopyWith<_HistoryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
