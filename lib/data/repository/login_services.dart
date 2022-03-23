import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {


  Future loginByNumAndPassword(String phoneNumber, String password) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: <String, String>{
          'Accept': 'application/json;',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'phone': phoneNumber, "password": password},),
      );

      final data = jsonDecode(response.body);
      try{
        log("Status Code::: 200");
        sharedPreferences.setString('phone', phoneNumber);
        sharedPreferences.setInt('id', data["id"] as int);
        sharedPreferences.setString('token', data["token"] as String);
        getProfile(data["token"] as String);
        return response.statusCode;
      } catch(e) {
        throw ErrorException(message: data["message"] as String);
      }

  }

  Future<void> loginByCode(String phoneNumber) async {

      log("inside");
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login/phone'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'phone': phoneNumber}),
      );

      final data = jsonDecode(response.body);
      try{
        log("Status Code::: 200");

        sharedPreferences.setString('phone', data["phone"] as String);
      } catch(e) {
        throw ErrorException(message: data["message"] as String);
      }

  }

  Future loginByCodeConfirmation(String code) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String? phoneNumber = sharedPreferences.getString('phone');
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login/confirm'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'phone': phoneNumber!, 'verification_code': code},),
      );

      log("PHONE NUMBER:::::$phoneNumber");
      log("CODE:::::$code");
      final data = jsonDecode(response.body);
      try {
        log("Status Code::: 200");
        sharedPreferences.setString('phone', phoneNumber);
        sharedPreferences.setInt('id', data["id"] as int);
        sharedPreferences.setString('token', data["token"] as String);
        getProfile(data["token"] as String);
        return response.statusCode;
      } catch(e) {
        log("${data["message"]}");
        throw ErrorException(message: data["message"] as String);
      }
  }

  Future registration(String name, String phoneNumber, String password,
      String passwordConfirmation,) async {

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: <String, String>{
          'Accept': 'application/json;',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'phone': phoneNumber,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
      );

      final data = jsonDecode(response.body);
      try {
        log("Status Code::: 200");
        sharedPreferences.setString('phone', data["phone"] as String);
        return response.statusCode;
      } catch(e) {
        log("${data["message"]}");
        throw ErrorException(message: data["message"] as String);
      }
  }

  Future registerConfirmation(String code) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String? phoneNumber = sharedPreferences.getString('phone');
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register/confirm'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'phone': phoneNumber!, 'verification_code': code},),
      );

      log("PHONE NUMBER:::::$phoneNumber");
      log("CODE:::::$code");
      final data = jsonDecode(response.body);
     try {
        log("Status Code::: 200");
        sharedPreferences.setString('phone', phoneNumber);
        sharedPreferences.setInt('id', data["id"] as int);
        sharedPreferences.setString('token', data["token"] as String);
        getProfile(data["token"] as String);
        return response.statusCode;
      }  catch(e){
        log("${data["message"]}");
        throw ErrorException(message: data["message"] as String);
      }
  }

  Future<void> logOut() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", "");
    sharedPreferences.setInt("id", -1);
    sharedPreferences.setString("phone", "");
    sharedPreferences.setString("bonus", "");
  }


  Future<void> setPinCode(String pinCode) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("pinCode", pinCode);
  }

  Future<void> setNameAndBonus(String name, String bonus) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("bonus", bonus);
  }

  Future<bool> getProfile(String token) async {
    bool a=false;
    try{
    final response = await http.get(
      Uri.parse('https://api.7food.kz/v1/users/profile'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("Status Code::: 200");
        log('$data');
        setNameAndBonus(
          data["data"]["name"] as String, data["data"]["bonus"] as String,);
        a=true;
      }
    }catch(e){
      log("$e");
      return a=false;
    }
    return a;
  }



}
