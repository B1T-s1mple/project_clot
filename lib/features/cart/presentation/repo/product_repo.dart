import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:scot/features/cart/model/products_model.dart';

class ProductsRepo {
  Future<List<ProductModel>> getProducts() async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      final headers = {'accept': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
      final response = await http.get(
        Uri.parse("http://45.130.148.176:8000/products"),
        headers: headers,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return (data as List).map((e) => ProductModel.fromJson(e)).toList();
      }
      throw data.toString();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
