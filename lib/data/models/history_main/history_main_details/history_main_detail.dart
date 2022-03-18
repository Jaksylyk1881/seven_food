import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_main_detail.freezed.dart';
part 'history_main_detail.g.dart';

@freezed
class HistoryMainDetail with _$HistoryMainDetail{
  factory HistoryMainDetail({
    String? name,
    int? quantity,
    String? price,
  }) = _HistoryMainDetail;
  factory HistoryMainDetail.fromJson(Map<String, dynamic> json) =>
      _$HistoryMainDetailFromJson(json);

}
