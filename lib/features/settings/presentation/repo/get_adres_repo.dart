import 'dart:convert';

import 'package:http/http.dart' as http;

class GetAdresRepo {
  Future<List<dynamic>> getAddresses() async {
    try {
      final response = await http.get(
        Uri.parse("http://45.130.148.176:8000/user/addresses"),
        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNyIsImV4cCI6MTc3OTg2Mjg1OH0.BVmEp68EZpmfbcoSxouqCf0E3iBsam5PDk-dsr6wieU',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['detail'] ?? "Manzillarni yuklab bo'lmadi");
      }
    } catch (e) {
      print("GetAddress Error: ${e.toString()}");
      rethrow;
    }
  }
}
