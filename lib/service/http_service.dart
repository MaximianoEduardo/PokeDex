import 'package:http/http.dart' as http;

class HttpService {
  static String baseUrl = 'https://pokeapi.co/api/v2/';

  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;

    final url = Uri.parse("$baseUrl$endPoint");

    try {
      response = await http.get(url);
    } on Exception {
      rethrow;
    }

    return response;
  }
}
