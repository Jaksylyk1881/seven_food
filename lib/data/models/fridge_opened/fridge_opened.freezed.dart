// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fridge_opened.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FridgeOpened _$FridgeOpenedFromJson(Map<String, dynamic> json) {
  return _FridgeOpened.fromJson(json);
}

/// @nodoc
class _$FridgeOpenedTearOff {
  const _$FridgeOpenedTearOff();

  _FridgeOpened call(
      {@JsonKey(name: "current_bonus") int? currentBonus, List<Cardd>? cards}) {
    return _FridgeOpened(
      currentBonus: currentBonus,
      cards: cards,
    );
  }

  FridgeOpened fromJson(Map<String, Object?> json) {
    return FridgeOpened.fromJson(json);
  }
}

/// @nodoc
const $FridgeOpened = _$FridgeOpenedTearOff();

/// @nodoc
mixin _$FridgeOpened {
  @JsonKey(name: "current_bonus")
  int? get currentBonus => throw _privateConstructorUsedError;
  List<Cardd>? get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeOpenedCopyWith<FridgeOpened> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeOpenedCopyWith<$Res> {
  factory $FridgeOpenedCopyWith(
          FridgeOpened value, $Res Function(FridgeOpened) then) =
      _$FridgeOpenedCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "current_bonus") int? currentBonus, List<Cardd>? cards});
}

/// @nodoc
class _$FridgeOpenedCopyWithImpl<$Res> implements $FridgeOpenedCopyWith<$Res> {
  _$FridgeOpenedCopyWithImpl(this._value, this._then);

  final FridgeOpened _value;
  // ignore: unused_field
  final $Res Function(FridgeOpened) _then;

  @override
  $Res call({
    Object? currentBonus = freezed,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      currentBonus: currentBonus == freezed
          ? _value.currentBonus
          : currentBonus // ignore: cast_nullable_to_non_nullable
              as int?,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Cardd>?,
    ));
  }
}

/// @nodoc
abstract class _$FridgeOpenedCopyWith<$Res>
    implements $FridgeOpenedCopyWith<$Res> {
  factory _$FridgeOpenedCopyWith(
          _FridgeOpened value, $Res Function(_FridgeOpened) then) =
      __$FridgeOpenedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "current_bonus") int? currentBonus, List<Cardd>? cards});
}

/// @nodoc
class __$FridgeOpenedCopyWithImpl<$Res> extends _$FridgeOpenedCopyWithImpl<$Res>
    implements _$FridgeOpenedCopyWith<$Res> {
  __$FridgeOpenedCopyWithImpl(
      _FridgeOpened _value, $Res Function(_FridgeOpened) _then)
      : super(_value, (v) => _then(v as _FridgeOpened));

  @override
  _FridgeOpened get _value => super._value as _FridgeOpened;

  @override
  $Res call({
    Object? currentBonus = freezed,
    Object? cards = freezed,
  }) {
    return _then(_FridgeOpened(
      currentBonus: currentBonus == freezed
          ? _value.currentBonus
          : currentBonus // ignore: cast_nullable_to_non_nullable
              as int?,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Cardd>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FridgeOpened implements _FridgeOpened {
  _$_FridgeOpened(
      {@JsonKey(name: "current_bonus") this.currentBonus, this.cards});

  factory _$_FridgeOpened.fromJson(Map<String, dynamic> json) =>
      _$$_FridgeOpenedFromJson(json);

  @override
  @JsonKey(name: "current_bonus")
  final int? currentBonus;
  @override
  final List<Cardd>? cards;

  @override
  String toString() {
    return 'FridgeOpened(currentBonus: $currentBonus, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FridgeOpened &&
            const DeepCollectionEquality()
                .equals(other.currentBonus, currentBonus) &&
            const DeepCollectionEquality().equals(other.cards, cards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentBonus),
      const DeepCollectionEquality().hash(cards));

  @JsonKey(ignore: true)
  @override
  _$FridgeOpenedCopyWith<_FridgeOpened> get copyWith =>
      __$FridgeOpenedCopyWithImpl<_FridgeOpened>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FridgeOpenedToJson(this);
  }
}

abstract class _FridgeOpened implements FridgeOpened {
  factory _FridgeOpened(
      {@JsonKey(name: "current_bonus") int? currentBonus,
      List<Cardd>? cards}) = _$_FridgeOpened;

  factory _FridgeOpened.fromJson(Map<String, dynamic> json) =
      _$_FridgeOpened.fromJson;

  @override
  @JsonKey(name: "current_bonus")
  int? get currentBonus;
  @override
  List<Cardd>? get cards;
  @override
  @JsonKey(ignore: true)
  _$FridgeOpenedCopyWith<_FridgeOpened> get copyWith =>
      throw _privateConstructorUsedError;
}
