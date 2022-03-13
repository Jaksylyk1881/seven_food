import 'package:freezed_annotation/freezed_annotation.dart';

part 'showcases.freezed.dart';
part 'showcases.g.dart';

@freezed
class Showcases with _$Showcases{
  factory Showcases({
    required int id,
    String? status,
    String? address,
    String? image,
    String? latitude,
    String? longitude,
}) = _Showcases;
  factory Showcases.fromJson(Map<String, dynamic> json) =>
      _$ShowcasesFromJson(json);
}
