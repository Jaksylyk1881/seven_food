import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/models/products/products.dart';
import 'package:seven_food/data/models/showcases/showcases.dart';
import 'package:seven_food/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowcasesService {
  Future<List<Product>> getProducts(int id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.get(
      Uri.parse('$baseUrl/users/showcases/$id/products?page=1'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    try{
      log("Status Code::: ${response.statusCode}");
      log("Status Code::: 200");
      // log('$data');
      return (data["data"] as List)
          .map((product) => Product.fromJson(product as Map<String, dynamic>))
          .toList();
    }catch(e){
      throw Exception(data['message']);
    }
  }

  Future<List<Showcases>> getShowcases() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    final response = await http.get(
      Uri.parse('$baseUrl/users/showcases'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final data = await jsonDecode(response.body);
    try{
      log("Status Code::: ${response.statusCode}");
      log("Status Code::: 200");
      log('$data');
      return (data["data"] as List)
          .map((showcase) =>
          Showcases.fromJson(showcase as Map<String, dynamic>),)
          .toList();
    }catch(e){
      throw Exception(data['message']);
    }

  }
}
