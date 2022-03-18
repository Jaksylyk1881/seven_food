// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cardd _$CarddFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
class _$CarddTearOff {
  const _$CarddTearOff();

  _Card call(
      {int? id, @JsonKey(name: 'masked_pan') String? maskedPan, String? type}) {
    return _Card(
      id: id,
      maskedPan: maskedPan,
      type: type,
    );
  }

  Cardd fromJson(Map<String, Object?> json) {
    return Cardd.fromJson(json);
  }
}

/// @nodoc
const $Cardd = _$CarddTearOff();

/// @nodoc
mixin _$Cardd {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'masked_pan')
  String? get maskedPan => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarddCopyWith<Cardd> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarddCopyWith<$Res> {
  factory $CarddCopyWith(Cardd value, $Res Function(Cardd) then) =
      _$CarddCopyWithImpl<$Res>;
  $Res call(
      {int? id, @JsonKey(name: 'masked_pan') String? maskedPan, String? type});
}

/// @nodoc
class _$CarddCopyWithImpl<$Res> implements $CarddCopyWith<$Res> {
  _$CarddCopyWithImpl(this._value, this._then);

  final Cardd _value;
  // ignore: unused_field
  final $Res Function(Cardd) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? maskedPan = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      maskedPan: maskedPan == freezed
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CardCopyWith<$Res> implements $CarddCopyWith<$Res> {
  factory _$CardCopyWith(_Card value, $Res Function(_Card) then) =
      __$CardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, @JsonKey(name: 'masked_pan') String? maskedPan, String? type});
}

/// @nodoc
class __$CardCopyWithImpl<$Res> extends _$CarddCopyWithImpl<$Res>
    implements _$CardCopyWith<$Res> {
  __$CardCopyWithImpl(_Card _value, $Res Function(_Card) _then)
      : super(_value, (v) => _then(v as _Card));

  @override
  _Card get _value => super._value as _Card;

  @override
  $Res call({
    Object? id = freezed,
    Object? maskedPan = freezed,
    Object? type = freezed,
  }) {
    return _then(_Card(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      maskedPan: maskedPan == freezed
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Card implements _Card {
  _$_Card({this.id, @JsonKey(name: 'masked_pan') this.maskedPan, this.type});

  factory _$_Card.fromJson(Map<String, dynamic> json) => _$$_CardFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'masked_pan')
  final String? maskedPan;
  @override
  final String? type;

  @override
  String toString() {
    return 'Cardd(id: $id, maskedPan: $maskedPan, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Card &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.maskedPan, maskedPan) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(maskedPan),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$CardCopyWith<_Card> get copyWith =>
      __$CardCopyWithImpl<_Card>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardToJson(this);
  }
}

abstract class _Card implements Cardd {
  factory _Card(
      {int? id,
      @JsonKey(name: 'masked_pan') String? maskedPan,
      String? type}) = _$_Card;

  factory _Card.fromJson(Map<String, dynamic> json) = _$_Card.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'masked_pan')
  String? get maskedPan;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$CardCopyWith<_Card> get copyWith => throw _privateConstructorUsedError;
}
