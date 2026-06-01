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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMSIsImV4cCI6MTc4MDM2OTcxMH0.WlDehDHxw5k_sB6xKWe3GrsJxjjjEpoAG3wctctdHCI',
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
