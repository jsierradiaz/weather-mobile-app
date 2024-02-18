import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static String get openWeatherAPI => dotenv.env['OPEN_WEATHER_API_KEY'] ?? '';
}
