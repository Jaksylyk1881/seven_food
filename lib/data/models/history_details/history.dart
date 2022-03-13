import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:seven_food/data/models/history_details/history_details_details/history_detail.dart';


part 'history.freezed.dart';
part 'history.g.dart';

@freezed
class HistoryDetail with _$HistoryDetail{
  factory HistoryDetail({
    required int id,
    String? date,
    String? time,
    String? address,
    String? total,
    List<HistoryDetailDetails>? details,
  }) = _History;
  factory HistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$HistoryDetailFromJson(json);

}
