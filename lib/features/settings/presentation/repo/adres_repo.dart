import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scot/features/settings/model/add_adress_model.dart';

class AddressRepo {
  Future<void> addAddress(AddAdressModel addressData) async {
    try {
      final response = await http.post(
        Uri.parse("http://45.130.148.176:8000/user/addresses"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNyIsImV4cCI6MTc3OTg2Mjg1OH0.BVmEp68EZpmfbcoSxouqCf0E3iBsam5PDk-dsr6wieU',
        },
        body: jsonEncode(addressData.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['detail'] ?? "adres yozilamidi krch");
      }
    } catch (e) {
      print("AddressRepo Error: ${e.toString()}");
      rethrow;
    }
  }

  
}