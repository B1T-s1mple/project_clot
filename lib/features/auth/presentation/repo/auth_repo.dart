import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scot/features/auth/presentation/model/auth_model.dart';

class AuthRepo {
  final String baseUrl = "http://45.130.148.176:8000";

  Future<void> register(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/signup"),

        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        final data = jsonDecode(response.body);
        throw data.toString();
      }
    } catch (e) {
      throw "Xatolik: $e";
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        final data = jsonDecode(response.body);
        throw data.toString();
      }
    } catch (e) {
      throw "Xatolik: $e";
    }
  }
}
