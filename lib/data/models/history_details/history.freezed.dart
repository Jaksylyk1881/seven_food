// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryDetail _$HistoryDetailFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
class _$HistoryDetailTearOff {
  const _$HistoryDetailTearOff();

  _History call(
      {required int id,
      String? date,
      String? time,
      String? address,
      String? total,
      List<HistoryDetailDetails>? details}) {
    return _History(
      id: id,
      date: date,
      time: time,
      address: address,
      total: total,
      details: details,
    );
  }

  HistoryDetail fromJson(Map<String, Object?> json) {
    return HistoryDetail.fromJson(json);
  }
}

/// @nodoc
const $HistoryDetail = _$HistoryDetailTearOff();

/// @nodoc
mixin _$HistoryDetail {
  int get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  List<HistoryDetailDetails>? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryDetailCopyWith<HistoryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDetailCopyWith<$Res> {
  factory $HistoryDetailCopyWith(
          HistoryDetail value, $Res Function(HistoryDetail) then) =
      _$HistoryDetailCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? date,
      String? time,
      String? address,
      String? total,
      List<HistoryDetailDetails>? details});
}

/// @nodoc
class _$HistoryDetailCopyWithImpl<$Res>
    implements $HistoryDetailCopyWith<$Res> {
  _$HistoryDetailCopyWithImpl(this._value, this._then);

  final HistoryDetail _value;
  // ignore: unused_field
  final $Res Function(HistoryDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? total = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<HistoryDetailDetails>?,
    ));
  }
}

/// @nodoc
abstract class _$HistoryCopyWith<$Res> implements $HistoryDetailCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) then) =
      __$HistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? date,
      String? time,
      String? address,
      String? total,
      List<HistoryDetailDetails>? details});
}

/// @nodoc
class __$HistoryCopyWithImpl<$Res> extends _$HistoryDetailCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(_History _value, $Res Function(_History) _then)
      : super(_value, (v) => _then(v as _History));

  @override
  _History get _value => super._value as _History;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? total = freezed,
    Object? details = freezed,
  }) {
    return _then(_History(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<HistoryDetailDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_History implements _History {
  _$_History(
      {required this.id,
      this.date,
      this.time,
      this.address,
      this.total,
      this.details});

  factory _$_History.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryFromJson(json);

  @override
  final int id;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? address;
  @override
  final String? total;
  @override
  final List<HistoryDetailDetails>? details;

  @override
  String toString() {
    return 'HistoryDetail(id: $id, date: $date, time: $time, address: $address, total: $total, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _History &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$HistoryCopyWith<_History> get copyWith =>
      __$HistoryCopyWithImpl<_History>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryToJson(this);
  }
}

abstract class _History implements HistoryDetail {
  factory _History(
      {required int id,
      String? date,
      String? time,
      String? address,
      String? total,
      List<HistoryDetailDetails>? details}) = _$_History;

  factory _History.fromJson(Map<String, dynamic> json) = _$_History.fromJson;

  @override
  int get id;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get address;
  @override
  String? get total;
  @override
  List<HistoryDetailDetails>? get details;
  @override
  @JsonKey(ignore: true)
  _$HistoryCopyWith<_History> get copyWith =>
      throw _privateConstructorUsedError;
}
