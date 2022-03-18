// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Showcases _$$_ShowcasesFromJson(Map<String, dynamic> json) => _$_Showcases(
      id: json['id'] as int,
      status: json['status'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$$_ShowcasesToJson(_$_Showcases instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'address': instance.address,
      'image': instance.image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
