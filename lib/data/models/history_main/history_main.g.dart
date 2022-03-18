// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryMain _$$_HistoryMainFromJson(Map<String, dynamic> json) =>
    _$_HistoryMain(
      id: json['id'] as int,
      showcaseId: json['showcase_id'] as int,
      showcaseAddress: json['showcase_address'] as String?,
      amount: json['amount'] as String?,
      totalAmount: json['total_amount'] as String?,
      usedBonus: json['used_bonus'] as String?,
      receivedBonus: json['received_bonus'] as String?,
      createdAt: json['created_at'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => HistoryMainDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryMainToJson(_$_HistoryMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'showcase_id': instance.showcaseId,
      'showcase_address': instance.showcaseAddress,
      'amount': instance.amount,
      'total_amount': instance.totalAmount,
      'used_bonus': instance.usedBonus,
      'received_bonus': instance.receivedBonus,
      'created_at': instance.createdAt,
      'details': instance.details,
    };
