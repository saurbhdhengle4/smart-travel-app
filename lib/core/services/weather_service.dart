import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import '../../data/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> fetchWeather(double lat, double lng) async {
    final uri = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$lat&longitude=$lng&current=temperature_2m,weather_code,wind_speed_10m',
    );

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Weather API failed with status ${response.statusCode}');
    }

    // Heavy JSON decode is moved off the UI isolate
    final Map<String, dynamic> jsonMap = await Isolate.run(() => jsonDecode(response.body) as Map<String, dynamic>);

    return WeatherModel.fromJson(jsonMap);
  }
}