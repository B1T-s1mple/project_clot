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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNyIsImV4cCI6MTc3OTg2Mjg1OH0.BVmEp68EZpmfbcoSxouqCf0E3iBsam5PDk-dsr6wieU',
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