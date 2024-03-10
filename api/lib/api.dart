// File: my_api_package/lib/api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl = 'http://127.0.0.1:8088';
  http.Client httpClient;

  ApiClient({http.Client? httpClient}) : this.httpClient = httpClient ?? http.Client();

  Future<List<String>> fetchCountries() async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/countries'));

    if (response.statusCode == 200) {
      final List<dynamic> countries = json.decode(response.body);
      return List<String>.from(countries);
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<dynamic>> fetchFamousSites(String country) async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/$country'));

    if (response.statusCode == 200) {
      final List<dynamic> sites = json.decode(response.body);
      return sites;
    } else {
      throw Exception('Failed to load sites');
    }
  }
}
