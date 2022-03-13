// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryMain _$$_HistoryMainFromJson(Map<String, dynamic> json) =>
    _$_HistoryMain(
      id: json['id'] as int,
      address: json['address'] as String?,
      price: json['price'] as String?,
      createdAt: json['created_at'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => HistoryMainDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryMainToJson(_$_HistoryMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'price': instance.price,
      'created_at': instance.createdAt,
      'details': instance.details,
    };
