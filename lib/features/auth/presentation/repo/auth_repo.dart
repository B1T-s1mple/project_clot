import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';

class AuthRepo {
  final String baseUrl = "http://45.130.148.176:8000";

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<UserModel> register(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/signup"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(data);
      } else {
        throw data['message'] ?? data.toString();
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

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = data['token'] ?? data['access_token'];

        if (token != null) {
          await _storage.write(key: 'auth_token', value: token);
          print(token);
        } else {
          throw "Serverdan token kelmadi.";
        }
        return;
      } else {
        throw data['message'] ?? data.toString();
      }
    } catch (e) {
      throw "Xatolik: $e";
    }
  }

  Future<void> completeProfile({
    required int userId,
    required AgePrifile request,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse("$baseUrl/auth/complete-profile/$userId"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        if (response.body.isEmpty) {
          throw "Server profilni yangilay olmadi.";
        }
        final data = jsonDecode(response.body);
        throw data['message'] ?? data.toString();
      }
    } catch (e) {
      throw "Xatolik: $e";
    }
  }
}
