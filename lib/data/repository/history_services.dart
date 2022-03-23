import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/history_details/history.dart';
import 'package:seven_food/data/models/history_details/history_details_details/history_detail.dart';
import 'package:seven_food/data/models/history_main/history_main.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HistoryServices{
  Future<List<HistoryMain>> getHistories(int page) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.get(
      Uri.parse('$baseUrl/users/histories?page=$page'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    try{
      log("Status Code::: ${response.statusCode}");
      return (data["data"] as List)
          .map((history) =>
          HistoryMain.fromJson(history as Map<String, dynamic>),)
          .toList();
    }catch(e){
      log("${data["message"]}");
      throw ErrorException(message:data['message'] as String);
    }
  }

  Future<HistoryDetail> getHistoryDetail(int id) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
      final response = await http.get(
        Uri.parse('$baseUrl/users/histories/$id/details'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      final data = await jsonDecode(response.body);
      try{
        log("Status Code::: ${response.statusCode}");
        // log('$data');
        final HistoryDetail historyDetail = HistoryDetail(
          id: data["data"]["id"] as int,
          date: data["data"]["date"] as String?,
          address: data["data"]["address"] as String?,
          total: data["data"]["total"] as String?,
          details: (data["data"]["details"] as List?)
              ?.map((product) => HistoryDetailDetails.fromJson(product as Map<String, dynamic>))
              .toList(),
        );
        return historyDetail;
      }catch(e){
        log("${data["message"]}");
        throw ErrorException(message:data['message'] as String);
      }
  }
}
