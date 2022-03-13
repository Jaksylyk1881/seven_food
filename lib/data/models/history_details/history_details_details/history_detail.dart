import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_detail.freezed.dart';
part 'history_detail.g.dart';

@freezed
class HistoryDetailDetails with _$HistoryDetailDetails{
  factory HistoryDetailDetails({
    String? name,
    String? price,
    String? quantity,
    String? sum,
  }) = _HistoryDetail;
  factory HistoryDetailDetails.fromJson(Map<String, dynamic> json) =>
      _$HistoryDetailDetailsFromJson(json);
}
