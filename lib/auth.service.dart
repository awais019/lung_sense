import 'package:lung_sense/user_store.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static Future<http.Response> registerUser(
    String name,
    String email,
    String age,
    String weight,
    String password,
  ) async {
    final baseUrl = UserStore().baseUrl;
    if (baseUrl == null) {
      throw Exception('Base URL not set');
    }
    String url = "$baseUrl/register";

    return http.post(
      Uri.parse(url),
      body: jsonEncode({
        'name': name,
        'email': email,
        'age': age,
        'weight': weight,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<http.Response> signInUser(String email, String password) async {
    final baseUrl = UserStore().baseUrl;
    if (baseUrl == null) {
      throw Exception('Base URL not set');
    }
    String url = "$baseUrl/signin";

    return http.post(
      Uri.parse(url),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
