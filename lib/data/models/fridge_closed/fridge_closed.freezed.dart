// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fridge_closed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FridgeClosed _$FridgeClosedFromJson(Map<String, dynamic> json) {
  return _FridgeClosed.fromJson(json);
}

/// @nodoc
class _$FridgeClosedTearOff {
  const _$FridgeClosedTearOff();

  _FridgeClosed call({bool? success, Data? data}) {
    return _FridgeClosed(
      success: success,
      data: data,
    );
  }

  FridgeClosed fromJson(Map<String, Object?> json) {
    return FridgeClosed.fromJson(json);
  }
}

/// @nodoc
const $FridgeClosed = _$FridgeClosedTearOff();

/// @nodoc
mixin _$FridgeClosed {
  bool? get success => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeClosedCopyWith<FridgeClosed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeClosedCopyWith<$Res> {
  factory $FridgeClosedCopyWith(
          FridgeClosed value, $Res Function(FridgeClosed) then) =
      _$FridgeClosedCopyWithImpl<$Res>;
  $Res call({bool? success, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FridgeClosedCopyWithImpl<$Res> implements $FridgeClosedCopyWith<$Res> {
  _$FridgeClosedCopyWithImpl(this._value, this._then);

  final FridgeClosed _value;
  // ignore: unused_field
  final $Res Function(FridgeClosed) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  @override
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$FridgeClosedCopyWith<$Res>
    implements $FridgeClosedCopyWith<$Res> {
  factory _$FridgeClosedCopyWith(
          _FridgeClosed value, $Res Function(_FridgeClosed) then) =
      __$FridgeClosedCopyWithImpl<$Res>;
  @override
  $Res call({bool? success, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$FridgeClosedCopyWithImpl<$Res> extends _$FridgeClosedCopyWithImpl<$Res>
    implements _$FridgeClosedCopyWith<$Res> {
  __$FridgeClosedCopyWithImpl(
      _FridgeClosed _value, $Res Function(_FridgeClosed) _then)
      : super(_value, (v) => _then(v as _FridgeClosed));

  @override
  _FridgeClosed get _value => super._value as _FridgeClosed;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_FridgeClosed(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FridgeClosed implements _FridgeClosed {
  _$_FridgeClosed({this.success, this.data});

  factory _$_FridgeClosed.fromJson(Map<String, dynamic> json) =>
      _$$_FridgeClosedFromJson(json);

  @override
  final bool? success;
  @override
  final Data? data;

  @override
  String toString() {
    return 'FridgeClosed(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FridgeClosed &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$FridgeClosedCopyWith<_FridgeClosed> get copyWith =>
      __$FridgeClosedCopyWithImpl<_FridgeClosed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FridgeClosedToJson(this);
  }
}

abstract class _FridgeClosed implements FridgeClosed {
  factory _FridgeClosed({bool? success, Data? data}) = _$_FridgeClosed;

  factory _FridgeClosed.fromJson(Map<String, dynamic> json) =
      _$_FridgeClosed.fromJson;

  @override
  bool? get success;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$FridgeClosedCopyWith<_FridgeClosed> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
class _$DataTearOff {
  const _$DataTearOff();

  _Data call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      @JsonKey(name: "received_bonus") String? receivedBonus,
      CardClosed? card}) {
    return _Data(
      totalAmount: totalAmount,
      usedBonus: usedBonus,
      receivedBonus: receivedBonus,
      card: card,
    );
  }

  Data fromJson(Map<String, Object?> json) {
    return Data.fromJson(json);
  }
}

/// @nodoc
const $Data = _$DataTearOff();

/// @nodoc
mixin _$Data {
  @JsonKey(name: "total_amount")
  String? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "used_bonus")
  String? get usedBonus => throw _privateConstructorUsedError;
  @JsonKey(name: "received_bonus")
  String? get receivedBonus => throw _privateConstructorUsedError;
  CardClosed? get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      @JsonKey(name: "received_bonus") String? receivedBonus,
      CardClosed? card});

  $CardClosedCopyWith<$Res>? get card;
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  final Data _value;
  // ignore: unused_field
  final $Res Function(Data) _then;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? usedBonus = freezed,
    Object? receivedBonus = freezed,
    Object? card = freezed,
  }) {
    return _then(_value.copyWith(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: usedBonus == freezed
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedBonus: receivedBonus == freezed
          ? _value.receivedBonus
          : receivedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardClosed?,
    ));
  }

  @override
  $CardClosedCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $CardClosedCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
abstract class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      @JsonKey(name: "received_bonus") String? receivedBonus,
      CardClosed? card});

  @override
  $CardClosedCopyWith<$Res>? get card;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? usedBonus = freezed,
    Object? receivedBonus = freezed,
    Object? card = freezed,
  }) {
    return _then(_Data(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: usedBonus == freezed
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedBonus: receivedBonus == freezed
          ? _value.receivedBonus
          : receivedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardClosed?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  _$_Data(
      {@JsonKey(name: "total_amount") this.totalAmount,
      @JsonKey(name: "used_bonus") this.usedBonus,
      @JsonKey(name: "received_bonus") this.receivedBonus,
      this.card});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  @JsonKey(name: "total_amount")
  final String? totalAmount;
  @override
  @JsonKey(name: "used_bonus")
  final String? usedBonus;
  @override
  @JsonKey(name: "received_bonus")
  final String? receivedBonus;
  @override
  final CardClosed? card;

  @override
  String toString() {
    return 'Data(totalAmount: $totalAmount, usedBonus: $usedBonus, receivedBonus: $receivedBonus, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality().equals(other.usedBonus, usedBonus) &&
            const DeepCollectionEquality()
                .equals(other.receivedBonus, receivedBonus) &&
            const DeepCollectionEquality().equals(other.card, card));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(usedBonus),
      const DeepCollectionEquality().hash(receivedBonus),
      const DeepCollectionEquality().hash(card));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      @JsonKey(name: "received_bonus") String? receivedBonus,
      CardClosed? card}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  @JsonKey(name: "total_amount")
  String? get totalAmount;
  @override
  @JsonKey(name: "used_bonus")
  String? get usedBonus;
  @override
  @JsonKey(name: "received_bonus")
  String? get receivedBonus;
  @override
  CardClosed? get card;
  @override
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

CardClosed _$CardClosedFromJson(Map<String, dynamic> json) {
  return _CardClosed.fromJson(json);
}

/// @nodoc
class _$CardClosedTearOff {
  const _$CardClosedTearOff();

  _CardClosed call(
      {String? type, @JsonKey(name: "last_four") String? lastFour}) {
    return _CardClosed(
      type: type,
      lastFour: lastFour,
    );
  }

  CardClosed fromJson(Map<String, Object?> json) {
    return CardClosed.fromJson(json);
  }
}

/// @nodoc
const $CardClosed = _$CardClosedTearOff();

/// @nodoc
mixin _$CardClosed {
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "last_four")
  String? get lastFour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardClosedCopyWith<CardClosed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardClosedCopyWith<$Res> {
  factory $CardClosedCopyWith(
          CardClosed value, $Res Function(CardClosed) then) =
      _$CardClosedCopyWithImpl<$Res>;
  $Res call({String? type, @JsonKey(name: "last_four") String? lastFour});
}

/// @nodoc
class _$CardClosedCopyWithImpl<$Res> implements $CardClosedCopyWith<$Res> {
  _$CardClosedCopyWithImpl(this._value, this._then);

  final CardClosed _value;
  // ignore: unused_field
  final $Res Function(CardClosed) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? lastFour = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFour: lastFour == freezed
          ? _value.lastFour
          : lastFour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CardClosedCopyWith<$Res> implements $CardClosedCopyWith<$Res> {
  factory _$CardClosedCopyWith(
          _CardClosed value, $Res Function(_CardClosed) then) =
      __$CardClosedCopyWithImpl<$Res>;
  @override
  $Res call({String? type, @JsonKey(name: "last_four") String? lastFour});
}

/// @nodoc
class __$CardClosedCopyWithImpl<$Res> extends _$CardClosedCopyWithImpl<$Res>
    implements _$CardClosedCopyWith<$Res> {
  __$CardClosedCopyWithImpl(
      _CardClosed _value, $Res Function(_CardClosed) _then)
      : super(_value, (v) => _then(v as _CardClosed));

  @override
  _CardClosed get _value => super._value as _CardClosed;

  @override
  $Res call({
    Object? type = freezed,
    Object? lastFour = freezed,
  }) {
    return _then(_CardClosed(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFour: lastFour == freezed
          ? _value.lastFour
          : lastFour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardClosed implements _CardClosed {
  _$_CardClosed({this.type, @JsonKey(name: "last_four") this.lastFour});

  factory _$_CardClosed.fromJson(Map<String, dynamic> json) =>
      _$$_CardClosedFromJson(json);

  @override
  final String? type;
  @override
  @JsonKey(name: "last_four")
  final String? lastFour;

  @override
  String toString() {
    return 'CardClosed(type: $type, lastFour: $lastFour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardClosed &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.lastFour, lastFour));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(lastFour));

  @JsonKey(ignore: true)
  @override
  _$CardClosedCopyWith<_CardClosed> get copyWith =>
      __$CardClosedCopyWithImpl<_CardClosed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardClosedToJson(this);
  }
}

abstract class _CardClosed implements CardClosed {
  factory _CardClosed(
      {String? type,
      @JsonKey(name: "last_four") String? lastFour}) = _$_CardClosed;

  factory _CardClosed.fromJson(Map<String, dynamic> json) =
      _$_CardClosed.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(name: "last_four")
  String? get lastFour;
  @override
  @JsonKey(ignore: true)
  _$CardClosedCopyWith<_CardClosed> get copyWith =>
      throw _privateConstructorUsedError;
}
