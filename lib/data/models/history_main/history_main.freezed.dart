// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryMain _$HistoryMainFromJson(Map<String, dynamic> json) {
  return _HistoryMain.fromJson(json);
}

/// @nodoc
class _$HistoryMainTearOff {
  const _$HistoryMainTearOff();

  _HistoryMain call(
      {required int id,
      String? address,
      String? price,
      @JsonKey(name: 'created_at') String? createdAt,
      List<HistoryMainDetail>? details}) {
    return _HistoryMain(
      id: id,
      address: address,
      price: price,
      createdAt: createdAt,
      details: details,
    );
  }

  HistoryMain fromJson(Map<String, Object?> json) {
    return HistoryMain.fromJson(json);
  }
}

/// @nodoc
const $HistoryMain = _$HistoryMainTearOff();

/// @nodoc
mixin _$HistoryMain {
  int get id => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  List<HistoryMainDetail>? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryMainCopyWith<HistoryMain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryMainCopyWith<$Res> {
  factory $HistoryMainCopyWith(
          HistoryMain value, $Res Function(HistoryMain) then) =
      _$HistoryMainCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? address,
      String? price,
      @JsonKey(name: 'created_at') String? createdAt,
      List<HistoryMainDetail>? details});
}

/// @nodoc
class _$HistoryMainCopyWithImpl<$Res> implements $HistoryMainCopyWith<$Res> {
  _$HistoryMainCopyWithImpl(this._value, this._then);

  final HistoryMain _value;
  // ignore: unused_field
  final $Res Function(HistoryMain) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? price = freezed,
    Object? createdAt = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<HistoryMainDetail>?,
    ));
  }
}

/// @nodoc
abstract class _$HistoryMainCopyWith<$Res>
    implements $HistoryMainCopyWith<$Res> {
  factory _$HistoryMainCopyWith(
          _HistoryMain value, $Res Function(_HistoryMain) then) =
      __$HistoryMainCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? address,
      String? price,
      @JsonKey(name: 'created_at') String? createdAt,
      List<HistoryMainDetail>? details});
}

/// @nodoc
class __$HistoryMainCopyWithImpl<$Res> extends _$HistoryMainCopyWithImpl<$Res>
    implements _$HistoryMainCopyWith<$Res> {
  __$HistoryMainCopyWithImpl(
      _HistoryMain _value, $Res Function(_HistoryMain) _then)
      : super(_value, (v) => _then(v as _HistoryMain));

  @override
  _HistoryMain get _value => super._value as _HistoryMain;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? price = freezed,
    Object? createdAt = freezed,
    Object? details = freezed,
  }) {
    return _then(_HistoryMain(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<HistoryMainDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryMain implements _HistoryMain {
  _$_HistoryMain(
      {required this.id,
      this.address,
      this.price,
      @JsonKey(name: 'created_at') this.createdAt,
      this.details});

  factory _$_HistoryMain.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryMainFromJson(json);

  @override
  final int id;
  @override
  final String? address;
  @override
  final String? price;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final List<HistoryMainDetail>? details;

  @override
  String toString() {
    return 'HistoryMain(id: $id, address: $address, price: $price, createdAt: $createdAt, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryMain &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$HistoryMainCopyWith<_HistoryMain> get copyWith =>
      __$HistoryMainCopyWithImpl<_HistoryMain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryMainToJson(this);
  }
}

abstract class _HistoryMain implements HistoryMain {
  factory _HistoryMain(
      {required int id,
      String? address,
      String? price,
      @JsonKey(name: 'created_at') String? createdAt,
      List<HistoryMainDetail>? details}) = _$_HistoryMain;

  factory _HistoryMain.fromJson(Map<String, dynamic> json) =
      _$_HistoryMain.fromJson;

  @override
  int get id;
  @override
  String? get address;
  @override
  String? get price;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  List<HistoryMainDetail>? get details;
  @override
  @JsonKey(ignore: true)
  _$HistoryMainCopyWith<_HistoryMain> get copyWith =>
      throw _privateConstructorUsedError;
}
