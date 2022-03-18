// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fridge_opened.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FridgeOpened _$$_FridgeOpenedFromJson(Map<String, dynamic> json) =>
    _$_FridgeOpened(
      currentBonus: json['current_bonus'] as int?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Cardd.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FridgeOpenedToJson(_$_FridgeOpened instance) =>
    <String, dynamic>{
      'current_bonus': instance.currentBonus,
      'cards': instance.cards,
    };
