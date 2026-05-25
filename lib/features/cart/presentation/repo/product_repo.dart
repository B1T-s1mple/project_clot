import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:scot/features/cart/model/products_model.dart';

class ProductsRepo {
  Future<List<ProductModel>> getProducts({
    String? search,
    int? categoryId,
    String? gender,
    double? minPrice,
    double? maxPrice,
    bool? onSale,
    bool? freeShipping,
    String? sort,
  }) async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      final headers = {'accept': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
      final Map<String, String> queryParams = {};
      if (search != null) {
        queryParams['search'] = search;
      }
      if (categoryId != null) {
        queryParams['category_id'] = categoryId.toString();
      }
      if (gender != null) {
        queryParams['gender'] = gender;
      }
      if (minPrice != null) {
        queryParams['min_price'] = minPrice.toString();
      }
      if (maxPrice != null) {
        queryParams['max_price'] = maxPrice.toString();
      }
      if (maxPrice != null) {
        queryParams['max_price'] = maxPrice.toString();
      }
      if (onSale != null) {
        queryParams['on_sale'] = onSale.toString();
      }
      if (freeShipping != null) {
        queryParams['free_shipping'] = freeShipping.toString();
      }

      if (sort != null) {
        queryParams['sort'] = sort;
      }

      final response = await http.get(
        Uri.parse("http://45.130.148.176:8000/products").replace(queryParameters: queryParams),
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
