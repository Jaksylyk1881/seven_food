// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_main_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryMainDetail _$HistoryMainDetailFromJson(Map<String, dynamic> json) {
  return _HistoryMainDetail.fromJson(json);
}

/// @nodoc
class _$HistoryMainDetailTearOff {
  const _$HistoryMainDetailTearOff();

  _HistoryMainDetail call({String? name, int? quantity}) {
    return _HistoryMainDetail(
      name: name,
      quantity: quantity,
    );
  }

  HistoryMainDetail fromJson(Map<String, Object?> json) {
    return HistoryMainDetail.fromJson(json);
  }
}

/// @nodoc
const $HistoryMainDetail = _$HistoryMainDetailTearOff();

/// @nodoc
mixin _$HistoryMainDetail {
  String? get name => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryMainDetailCopyWith<HistoryMainDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryMainDetailCopyWith<$Res> {
  factory $HistoryMainDetailCopyWith(
          HistoryMainDetail value, $Res Function(HistoryMainDetail) then) =
      _$HistoryMainDetailCopyWithImpl<$Res>;
  $Res call({String? name, int? quantity});
}

/// @nodoc
class _$HistoryMainDetailCopyWithImpl<$Res>
    implements $HistoryMainDetailCopyWith<$Res> {
  _$HistoryMainDetailCopyWithImpl(this._value, this._then);

  final HistoryMainDetail _value;
  // ignore: unused_field
  final $Res Function(HistoryMainDetail) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$HistoryMainDetailCopyWith<$Res>
    implements $HistoryMainDetailCopyWith<$Res> {
  factory _$HistoryMainDetailCopyWith(
          _HistoryMainDetail value, $Res Function(_HistoryMainDetail) then) =
      __$HistoryMainDetailCopyWithImpl<$Res>;
  @override
  $Res call({String? name, int? quantity});
}

/// @nodoc
class __$HistoryMainDetailCopyWithImpl<$Res>
    extends _$HistoryMainDetailCopyWithImpl<$Res>
    implements _$HistoryMainDetailCopyWith<$Res> {
  __$HistoryMainDetailCopyWithImpl(
      _HistoryMainDetail _value, $Res Function(_HistoryMainDetail) _then)
      : super(_value, (v) => _then(v as _HistoryMainDetail));

  @override
  _HistoryMainDetail get _value => super._value as _HistoryMainDetail;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_HistoryMainDetail(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryMainDetail implements _HistoryMainDetail {
  _$_HistoryMainDetail({this.name, this.quantity});

  factory _$_HistoryMainDetail.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryMainDetailFromJson(json);

  @override
  final String? name;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'HistoryMainDetail(name: $name, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryMainDetail &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$HistoryMainDetailCopyWith<_HistoryMainDetail> get copyWith =>
      __$HistoryMainDetailCopyWithImpl<_HistoryMainDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryMainDetailToJson(this);
  }
}

abstract class _HistoryMainDetail implements HistoryMainDetail {
  factory _HistoryMainDetail({String? name, int? quantity}) =
      _$_HistoryMainDetail;

  factory _HistoryMainDetail.fromJson(Map<String, dynamic> json) =
      _$_HistoryMainDetail.fromJson;

  @override
  String? get name;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$HistoryMainDetailCopyWith<_HistoryMainDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
