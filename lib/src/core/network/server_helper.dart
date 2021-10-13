import 'package:http/http.dart' as http;
import 'package:rick_and_morty/src/core/error/exceptions.dart';
import 'package:rick_and_morty/src/core/utils/const.dart';

class ServerHelper {
  static Future<String> getApiRequest(String request) async {
    http.Client client = http.Client();
    final url = "$baseURL/api/$request";
    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }

  static Future<String> getRequest(String url) async {
    http.Client client = http.Client();
    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}