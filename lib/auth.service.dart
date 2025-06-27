import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.0.0.2:8000";

  static Future<http.Response> registerUser(
    String name,
    String email,
    String age,
    String weight,
    String password,
  ) async {
    String url = "$baseUrl/register";

    return http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'email': email,
        'age': age,
        'weight': weight,
        'password': password,
      },
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
  }

  static Future<http.Response> signInUser(String email, String password) async {
    String url = "$baseUrl/signin";

    return http.post(
      Uri.parse(url),
      body: {'email': email, 'password': password},
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
  }
}
