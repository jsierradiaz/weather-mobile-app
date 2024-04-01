import 'package:flutter/material.dart';
import 'package:weather_mobile_app/models/weather_data.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherData weather;

  const CurrentWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.primary,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${weather.temperature.toStringAsFixed(0)}°F',
                    style: const TextStyle(
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(width: 180),
                ],
              ),
              Text(
                weather.main,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                weather.weatherDescription,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${weather.maxTemperature.toStringAsFixed(0)}°F / ${weather.minTemperature.toStringAsFixed(0)}°F Feels like ${weather.feelsLike.toStringAsFixed(0)}°F',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
