// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'showcases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Showcases _$ShowcasesFromJson(Map<String, dynamic> json) {
  return _Showcases.fromJson(json);
}

/// @nodoc
class _$ShowcasesTearOff {
  const _$ShowcasesTearOff();

  _Showcases call(
      {required int id,
      String? status,
      String? address,
      String? image,
      String? latitude,
      String? longitude}) {
    return _Showcases(
      id: id,
      status: status,
      address: address,
      image: image,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Showcases fromJson(Map<String, Object?> json) {
    return Showcases.fromJson(json);
  }
}

/// @nodoc
const $Showcases = _$ShowcasesTearOff();

/// @nodoc
mixin _$Showcases {
  int get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowcasesCopyWith<Showcases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowcasesCopyWith<$Res> {
  factory $ShowcasesCopyWith(Showcases value, $Res Function(Showcases) then) =
      _$ShowcasesCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? status,
      String? address,
      String? image,
      String? latitude,
      String? longitude});
}

/// @nodoc
class _$ShowcasesCopyWithImpl<$Res> implements $ShowcasesCopyWith<$Res> {
  _$ShowcasesCopyWithImpl(this._value, this._then);

  final Showcases _value;
  // ignore: unused_field
  final $Res Function(Showcases) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? image = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ShowcasesCopyWith<$Res> implements $ShowcasesCopyWith<$Res> {
  factory _$ShowcasesCopyWith(
          _Showcases value, $Res Function(_Showcases) then) =
      __$ShowcasesCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? status,
      String? address,
      String? image,
      String? latitude,
      String? longitude});
}

/// @nodoc
class __$ShowcasesCopyWithImpl<$Res> extends _$ShowcasesCopyWithImpl<$Res>
    implements _$ShowcasesCopyWith<$Res> {
  __$ShowcasesCopyWithImpl(_Showcases _value, $Res Function(_Showcases) _then)
      : super(_value, (v) => _then(v as _Showcases));

  @override
  _Showcases get _value => super._value as _Showcases;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? image = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_Showcases(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Showcases implements _Showcases {
  _$_Showcases(
      {required this.id,
      this.status,
      this.address,
      this.image,
      this.latitude,
      this.longitude});

  factory _$_Showcases.fromJson(Map<String, dynamic> json) =>
      _$$_ShowcasesFromJson(json);

  @override
  final int id;
  @override
  final String? status;
  @override
  final String? address;
  @override
  final String? image;
  @override
  final String? latitude;
  @override
  final String? longitude;

  @override
  String toString() {
    return 'Showcases(id: $id, status: $status, address: $address, image: $image, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Showcases &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$ShowcasesCopyWith<_Showcases> get copyWith =>
      __$ShowcasesCopyWithImpl<_Showcases>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShowcasesToJson(this);
  }
}

abstract class _Showcases implements Showcases {
  factory _Showcases(
      {required int id,
      String? status,
      String? address,
      String? image,
      String? latitude,
      String? longitude}) = _$_Showcases;

  factory _Showcases.fromJson(Map<String, dynamic> json) =
      _$_Showcases.fromJson;

  @override
  int get id;
  @override
  String? get status;
  @override
  String? get address;
  @override
  String? get image;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(ignore: true)
  _$ShowcasesCopyWith<_Showcases> get copyWith =>
      throw _privateConstructorUsedError;
}
