// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map<String, dynamic> json) => _$_History(
      id: json['id'] as int,
      date: json['date'] as String?,
      time: json['time'] as String?,
      address: json['address'] as String?,
      total: json['total'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => HistoryDetailDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'address': instance.address,
      'total': instance.total,
      'details': instance.details,
    };
