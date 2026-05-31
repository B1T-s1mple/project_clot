import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scot/features/cart/model/get_cards.dart';

class GetcardsRepo {
  final String url = 'http://45.130.148.176:8000/products/cart';

  Future<List<GetCards>> getCards() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMCIsImV4cCI6MTc4MDMxMzc5Nn0.J_8WU073qBQY9BAWTcs8-7PBOBZXf8jZE-AUbIHBNt8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        return jsonList.map((item) => GetCards.fromJson(item)).toList();
      } else {
        throw ('inet mb xato ${response.statusCode}');
      }
    } catch (xatolik) {
      throw (' $xatolik');
    }
  }
}
