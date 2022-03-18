import 'package:freezed_annotation/freezed_annotation.dart';


part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class Cardd with _$Cardd{
  factory Cardd({
    int? id,
    @JsonKey(name: 'masked_pan') String? maskedPan,
    String? type,
  }) = _Card;
  factory Cardd.fromJson(Map<String, dynamic> json) =>
      _$CarddFromJson(json);
}
