import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_mobile_app/models/weather_data.dart';

class WeatherService {
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherData> getWeatherData(double lat, double lon) async {
    var response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load weather');
    }
  }
}
