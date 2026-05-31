import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scot/features/auth/presentation/model/auth_model.dart';

class Cardrepo {
    Future<void> addcard(CardModel addacrd) async {
    try {
      final response = await http.post(
        Uri.parse("http://45.130.148.176:8000/user/cards"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMCIsImV4cCI6MTc4MDMxMzc5Nn0.J_8WU073qBQY9BAWTcs8-7PBOBZXf8jZE-AUbIHBNt8',
        },
        body: jsonEncode(addacrd.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['detail'] ?? "card kiritilimadi krch");
      }
    } catch (e) {
      print("AddressRepo Error: ${e.toString()}");
      rethrow;
    }
  }
}