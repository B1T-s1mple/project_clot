import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scot/features/settings/model/profil_model.dart';

class ProfilRepo {
  Future<ProfilModel> getInfoProfile() async {
    try {
      final response = await http.get(
        Uri.parse("http://45.130.148.176:8000/user/me"),

        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNyIsImV4cCI6MTc3OTg2Mjg1OH0.BVmEp68EZpmfbcoSxouqCf0E3iBsam5PDk-dsr6wieU',
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ProfilModel.fromJson(data);
      }
      throw data.toString();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}


