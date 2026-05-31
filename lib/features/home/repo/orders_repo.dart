import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scot/features/home/models/order_model.dart';

class OrdersRepo {
  Future<List<OrderModel>> getorders() async {
    try {
      final response = await http.get(
        Uri.parse("http://45.130.148.176:8000/orders"),

        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMCIsImV4cCI6MTc4MDMxMzc5Nn0.J_8WU073qBQY9BAWTcs8-7PBOBZXf8jZE-AUbIHBNt8',
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return (data as List).map((e) => OrderModel.fromJson(e)).toList();
      }
      throw data.toString();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
