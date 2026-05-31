import 'dart:convert';
import 'package:http/http.dart' as http;

class AddToBagRepo {
  Future<void> addToBag({
    required int productId,
    required String color,
    required String size,
    required int quantity,
  }) async {
    try {
      final Map<String, String> queryParams = {
        'product_id': productId.toString(),
        'color': color,
        'size': size,
        'quantity': quantity.toString(),
      };

      final uri = Uri.parse("http://45.130.148.176:8000/products/cart/add")
          .replace(queryParameters: queryParams);

      final response = await http.post(
        uri,
        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMCIsImV4cCI6MTc4MDMxMzc5Nn0.J_8WU073qBQY9BAWTcs8-7PBOBZXf8jZE-AUbIHBNt8', 
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final data = jsonDecode(response.body);
        throw data['detail'] ?? "Xatolik yuz berdi";
      }
    } catch (e) {
      print("Repo Error: ${e.toString()}");
      rethrow;
    }
  }
}