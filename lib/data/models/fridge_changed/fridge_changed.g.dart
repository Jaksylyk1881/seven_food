// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fridge_changed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FridgeChanged _$$_FridgeChangedFromJson(Map<String, dynamic> json) =>
    _$_FridgeChanged(
      totalAmount: json['total_amount'] as String?,
      usedBonus: json['used_bonus'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => FridgeProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FridgeChangedToJson(_$_FridgeChanged instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'used_bonus': instance.usedBonus,
      'products': instance.products,
    };

_$_FridgeProduct _$$_FridgeProductFromJson(Map<String, dynamic> json) =>
    _$_FridgeProduct(
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$$_FridgeProductToJson(_$_FridgeProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
    };
