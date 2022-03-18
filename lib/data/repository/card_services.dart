import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO Delete card
class CardServices {
  Future<String> addCard() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.post(
      Uri.parse('$baseUrl/users/cards/add'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    log("Status Code::: ${response.statusCode}");
    if (response.statusCode == 200) {
      String url = data["redirect_url"] as String;
      return url;
    } else {
      throw ErrorException(message: data['message'] as String);
    }
  }

  Future<List<Cardd>> getCards() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.get(
      Uri.parse('$baseUrl/users/cards'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    try {
      log("Status Code::: ${response.statusCode}");
      log('$data');
      return (data as List)
          .map((card) => Cardd.fromJson(card as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log("$e");
      throw ErrorException(message: "${data["message"]}");
    }
  }
}
