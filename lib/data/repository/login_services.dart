import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class LoginService{
  String baseUrl = "https://api.7food.kz/v1/auth";

  Future loginByNumAndPassword(String phoneNumber, String password) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Accept':'application/json;',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phoneNumber,
        "password":password
      }),
    );

    final data = jsonDecode(response.body);
    if(response.statusCode==200){
      log("Status Code::: 200");
      sharedPreferences.setInt('id', data["id"]);
      sharedPreferences.setString('token', data["token"]);
      return response.statusCode;
    }else{
      log("${data["message"]}");
      return data["message"];
    }
  }

  Future<void> loginByCode(String phoneNumber) async{
    try{
      log("inside");
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final response = await http.post(Uri.parse('$baseUrl/login/phone'),
        headers: <String, String>{
          'Accept':'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:  jsonEncode(<String,String>{
          'phone' : phoneNumber
        }),);

      final data = jsonDecode(response.body);
      if(response.statusCode == 200){
        log("Status Code::: 200");
        sharedPreferences.setString('phone', data["phone"]);
      }
    }catch(e){
      log('$e');
      throw Exception(e);
    }
  }
  Future loginByCodeConfirmation(String code) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? phoneNumber = sharedPreferences.getString('phone');
    final response = await http.post(Uri.parse('$baseUrl/login/confirm'),
      headers: <String, String>{
        'Accept':'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:  jsonEncode(<String,String>{
        'phone' : phoneNumber!,
        'verification_code': code
      }),);

    log("PHONE NUMBER:::::$phoneNumber");
    log("CODE:::::$code");
    final data = jsonDecode(response.body);
    if(response.statusCode==200){
      log("Status Code::: 200");
      sharedPreferences.setInt('id', data["id"]);
      sharedPreferences.setString('token', data["token"]);
      return response.statusCode;
    }else{
      log("${data["message"]}");
      return data["message"];
    }
  }


  Future registration(String name,String phoneNumber, String password, String passwordConfirmation) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Accept':'application/json;',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name':name,
        'phone': phoneNumber,
        "password":password,
        "password_confirmation":passwordConfirmation
      }),
    );

    final data = jsonDecode(response.body);
    if(response.statusCode==200){
      log("Status Code::: 200");
      sharedPreferences.setString('phone', data["phone"]);
      return response.statusCode;
    }else{
      log("${data["message"]}");
      return data["message"];
    }
  }
  Future registerConfirmation(String code) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? phoneNumber = sharedPreferences.getString('phone');
    final response = await http.post(Uri.parse('$baseUrl/register/confirm'),
      headers: <String, String>{
        'Accept':'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:  jsonEncode(<String,String>{
        'phone' : phoneNumber!,
        'verification_code': code
      }),);

    log("PHONE NUMBER:::::$phoneNumber");
    log("CODE:::::$code");
    final data = jsonDecode(response.body);
    if(response.statusCode==200){
      log("Status Code::: 200");
      sharedPreferences.setInt('id', data["id"]);
      sharedPreferences.setString('token', data["token"]);
      return response.statusCode;
    }else{
      log("${data["message"]}");
      return data["message"];
    }
  }

}