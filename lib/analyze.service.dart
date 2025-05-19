import 'package:http/http.dart' as http;

class Analyze {
  static Future<http.StreamedResponse> analyzeImage(String filePath) async {
    String url = "http://10.0.0.2:8000/predict";

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(await http.MultipartFile.fromPath('image', filePath));

    return request.send();
  }
}
