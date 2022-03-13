import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:seven_food/data/models/history_main/history_main_details/history_main_detail.dart';

part 'history_main.freezed.dart';
part 'history_main.g.dart';

@freezed
class HistoryMain with _$HistoryMain{
  factory HistoryMain({
    required int id,
    String? address,
    String? price,
    @JsonKey(name: 'created_at') String? createdAt,
    List<HistoryMainDetail>? details,
  }) = _HistoryMain;
  factory HistoryMain.fromJson(Map<String, dynamic> json) =>
      _$HistoryMainFromJson(json);
}
