import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_task/model/model.dart';

class ApiService {
  static const String apiUrl = "https://api.tvmaze.com/search/shows?q=all";

  Future<List<Welcome>> fetchMovies() async {
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print("API Response: ${response.body}");  // Log API response
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Welcome.fromJson(data)).toList();
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      throw Exception("Failed to load movies");
    }
  } catch (e) {
    print("Exception: $e");
    throw Exception("Failed to load movies");
  }
}
Future<List<Welcome>> searchMovies(String query) async {
  final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Welcome.fromJson(data)).toList();
  } else {
    throw Exception("Failed to load movies");
  }
}
}
