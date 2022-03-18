// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fridge_closed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FridgeClosed _$$_FridgeClosedFromJson(Map<String, dynamic> json) =>
    _$_FridgeClosed(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FridgeClosedToJson(_$_FridgeClosed instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      totalAmount: json['total_amount'] as String?,
      usedBonus: json['used_bonus'] as String?,
      receivedBonus: json['received_bonus'] as String?,
      card: json['card'] == null
          ? null
          : CardClosed.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'total_amount': instance.totalAmount,
      'used_bonus': instance.usedBonus,
      'received_bonus': instance.receivedBonus,
      'card': instance.card,
    };

_$_CardClosed _$$_CardClosedFromJson(Map<String, dynamic> json) =>
    _$_CardClosed(
      type: json['type'] as String?,
      lastFour: json['last_four'] as String?,
    );

Map<String, dynamic> _$$_CardClosedToJson(_$_CardClosed instance) =>
    <String, dynamic>{
      'type': instance.type,
      'last_four': instance.lastFour,
    };
