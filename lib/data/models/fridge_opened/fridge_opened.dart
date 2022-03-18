import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seven_food/data/models/card/card.dart';

part 'fridge_opened.freezed.dart';
part 'fridge_opened.g.dart';

@freezed
class FridgeOpened with _$FridgeOpened{
  factory FridgeOpened({
    @JsonKey(name: "current_bonus") int? currentBonus,
    List<Cardd>? cards,
  }) = _FridgeOpened;
  factory FridgeOpened.fromJson(Map<String, dynamic> json) =>
      _$FridgeOpenedFromJson(json);
}
