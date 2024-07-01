import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonsApi {
  static Future<Map<String, dynamic>?> fetchJsonData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      print("Pokemon code: ${response.statusCode}");
      if (response.statusCode == 200) {

        return jsonDecode(response.body)..remove("moves")..remove("game_indices");
      } else {
      }
    } catch (e) {}
    return null;
  }
}