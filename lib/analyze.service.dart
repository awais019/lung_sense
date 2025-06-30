import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lung_sense/user_store.dart';

class Analyze {
  static Future<http.StreamedResponse> analyzeImage(String filePath) async {
    final baseUrl = UserStore().baseUrl;
    if (baseUrl == null) {
      throw Exception('Base URL not set');
    }
    String url = "$baseUrl/predict";

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(await http.MultipartFile.fromPath('file', filePath));

    await UserStore().init();
    final token = UserStore().token;
    debugPrint('Token: $token');
    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    return request.send();
  }
}
