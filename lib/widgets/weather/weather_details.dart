import 'package:flutter/material.dart';
import 'package:weather_mobile_app/models/weather_data.dart';
import 'package:weather_mobile_app/widgets/weather/Pressure.dart';
import 'package:weather_mobile_app/widgets/weather/humidity.dart';
import 'package:weather_mobile_app/widgets/weather/sunrise.dart';
import 'package:weather_mobile_app/widgets/weather/visibility.dart';
import 'package:weather_mobile_app/widgets/weather/weather_data_calc.dart';
import 'package:weather_mobile_app/widgets/weather/wind.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherDataCalc(
          time: weatherData.time,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Wind(
                speed: weatherData.windSpeed.toString(),
                degree: weatherData.windDirection.toInt()),
            const SizedBox(width: 10),
            Humidity(humidity: weatherData.humidity.toInt()),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Pressure(pressure: weatherData.pressure.toInt()),
            const SizedBox(width: 10),
            VisibilityRange(visibility: weatherData.visibility),
          ],
        ),
        const SizedBox(height: 10),
        Sunrise(sunrise: weatherData.sunrise, sunset: weatherData.sunset),
      ],
    );
  }
}
