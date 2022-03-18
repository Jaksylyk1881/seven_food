import 'package:freezed_annotation/freezed_annotation.dart';

part 'fridge_changed.freezed.dart';
part 'fridge_changed.g.dart';

@freezed
class FridgeChanged with _$FridgeChanged{
  factory FridgeChanged({
    @JsonKey(name: "total_amount") String? totalAmount,
    @JsonKey(name: "used_bonus") String? usedBonus,
    List<FridgeProduct>? products,
  }) = _FridgeChanged;
  factory FridgeChanged.fromJson(Map<String, dynamic> json) =>
      _$FridgeChangedFromJson(json);
}

@freezed
class FridgeProduct with _$FridgeProduct{
  factory FridgeProduct({
    String? name,
    String? image,
    String? price,
    int? quantity,
  }) = _FridgeProduct;
  factory FridgeProduct.fromJson(Map<String, dynamic> json) =>
      _$FridgeProductFromJson(json);
}


