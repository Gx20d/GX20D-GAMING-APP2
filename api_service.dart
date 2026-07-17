import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://gx20d-gaming.great-site.net/api/games.php";

  static Future<List<dynamic>> getGames() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["games"];
    } else {
      throw Exception("Failed to load games");
    }
  }
}