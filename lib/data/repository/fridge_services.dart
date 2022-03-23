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
      sharedPreferences.setInt("orderID", data["order_id"] as int);
      return data["order_id"] as int;
    }else{
      log(data["message"] as String);
      throw ErrorException(message: data["message"] as String);
    }
  }

  Future purchasesUpdate({required int orderID, required int usedCardId, required bool isBonusUsed}) async{
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.post(
      Uri.parse('https://api.7food.kz/v1/users/purchases/clients/update'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String,dynamic>{
        "order_id":orderID,
        "used_card_id":usedCardId,
        "is_bonus_used":isBonusUsed
      }),
    );
    final data = await jsonDecode(response.body);
    if(response.statusCode == 200){
      log("purchases update done successful");
      return;
    }else{
      log(data["message"] as String);
      throw ErrorException(message: data["message"] as String);
    }
  }
}
