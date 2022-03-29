import 'dart:convert';
import 'dart:developer';

import 'package:cloudpayments/cloudpayments.dart';
import 'package:http/http.dart' as http;
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/card/card.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardServices {
  Future threeDSecure(
    String paymentId,
    String transactionId,
    String paReq,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.post(
      Uri.parse('https://api.7food.kz/v1/users/cards/post3ds'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, String>{
          "payment_id": paymentId,
          "transaction_id": transactionId,
          "paRes": paReq,
        },
      ),
    );
    final data = await jsonDecode(response.body);
    // try{
    //   if(response.statusCode!=200){
    //     throw Exception(data["message"] as String);
    //   }
    //   log("Card successfully added!");
    // }catch(e){
    //   log(data.toString());
    //   throw Exception(data["message"] as String);
    // }
    if (response.statusCode == 200) {
      log("Card successfully added!");
      return;
    } else {
      // log(data.toString());
      throw ErrorException(message:data["message"] as String);
    }
  }

  Future addCard({
    required String cardNumber,
    required String cardDate,
    required String cardCVC,
    required String name,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    const String publicId = "pk_743dd3f708ed687c7aba6172a336a";
    if (await Cloudpayments.isValidNumber(cardNumber)) {
      if (await Cloudpayments.isValidExpiryDate(cardDate)) {
        final cryptogram = await Cloudpayments.cardCryptogram(
          cardNumber: cardNumber,
          cardDate: cardDate,
          cardCVC: cardCVC,
          publicId: publicId,
        );
        log("CRYPTOGRAM::::::::::::::    ${cryptogram.cryptogram}");
        final response = await http.post(
          Uri.parse('$baseUrl/users/cards/auth'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            <String, String>{
              "cryptogram": cryptogram.cryptogram!,
              "name": name,
            },
          ),
        );
        final data = await jsonDecode(response.body);

        log("DATA::: ${data.toString()}");
        log("Status Code::: ${response.statusCode}");
        try {
          final bool success = data["Success"] as bool;
          final int paymentId = data["payment_id"] as int;
          if (!success) {
            final int transactionId = data["Model"]["TransactionId"] as int;
            final String paReq = data["Model"]["PaReq"] as String;
            final result = await Cloudpayments.show3ds(acsUrl: data["Model"]["AcsUrl"] as String, paReq: paReq, transactionId: transactionId.toString(),);
            await threeDSecure(
              paymentId.toString(),
              transactionId.toString(),
              result!.paRes!,
            );
          } else {
            log("Card successfully added!");
            return;
          }
        } catch (e) {
          log("asdfdsafqer");
          throw ErrorException(message: "Error while adding card");
        }
      } else {
        throw ErrorException(message: "Expire date is not valid!!!");
      }
    } else {
      throw ErrorException(message: "Card number is not valid!!!");
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

  Future<String> getBonus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.get(
      Uri.parse('https://api.7food.kz/v1/users/profile'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    try {
      sharedPreferences.setString("bonus", data["data"]["bonus"] as String);
      return data["data"]["bonus"] as String;
    } catch (e) {
      throw ErrorException(message: data["message"] as String);
    }
  }

  Future deleteCard(int id) async{
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.delete(
      Uri.parse('https://api.7food.kz/v1/users/cards/$id'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    if(response.statusCode==200){
     log("Deleted successfully");
    }else{
      throw ErrorException(message: data["message"] as String);
    }
  }

}
