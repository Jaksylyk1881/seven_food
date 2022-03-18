import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/exeption_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FridgeService{
  Future<int> openFridge(int fridgeId) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.post(
      Uri.parse('https://api.7food.kz/v1/users/purchases/clients/open'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String,int>{
        "fridge_id":fridgeId
      }),
    );
    final data = await jsonDecode(response.body);
    if(response.statusCode==200){
      return data["order_id"] as int;
    }else{
      log(data["message"] as String);
      throw ErrorException(message: data["message"] as String);
    }
  }
}
