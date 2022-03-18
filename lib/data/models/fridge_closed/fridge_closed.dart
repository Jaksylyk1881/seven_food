import 'package:freezed_annotation/freezed_annotation.dart';

part 'fridge_closed.freezed.dart';
part 'fridge_closed.g.dart';

@freezed
class FridgeClosed with _$FridgeClosed{
  factory FridgeClosed({
    bool? success,
    Data? data,
  }) = _FridgeClosed;
  factory FridgeClosed.fromJson(Map<String, dynamic> json) =>
      _$FridgeClosedFromJson(json);
}


@freezed
class Data with _$Data{
  factory Data({
    @JsonKey(name: "total_amount") String? totalAmount,
    @JsonKey(name: "used_bonus") String? usedBonus,
    @JsonKey(name: "received_bonus") String? receivedBonus,
    CardClosed? card,
  }) = _Data;
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}

@freezed
class CardClosed with _$CardClosed{
  factory CardClosed({
    String? type,
    @JsonKey(name: "last_four") String? lastFour,
  }) = _CardClosed;
  factory CardClosed.fromJson(Map<String, dynamic> json) =>
      _$CardClosedFromJson(json);
}
