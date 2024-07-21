import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';

class ApiService {
  final String _baseUrl = 'http://your-api-url';

  Future<List<WeatherModel>> getWeather(String location) async {
    final response = await http.get(Uri.parse('$_baseUrl/weather?location=$location'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => WeatherModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
