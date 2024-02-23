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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                '${weather.temperature.toStringAsFixed(0)}°F',
                style: const TextStyle(
                  fontSize: 48,
                ),
              ),
              const SizedBox(width: 180),
              Container(
                alignment: Alignment.centerRight,
                child: FutureBuilder(
                  future: () async {
                    try {
                      return await precacheImage(
                          NetworkImage(
                              'http://openweathermap.org/img/w/${weather.icon}.png'),
                          context);
                    } catch (error) {
                      return;
                    }
                  }(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.error != null) {
                      return const Icon(Icons.error);
                    } else {
                      return Image.network(
                        'http://openweathermap.org/img/w/${weather.icon}.png',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons
                              .error); // Return an error icon if an error occurs
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
          Text(
            weather.weatherDescription,
            style: const TextStyle(
              fontSize: 24,
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
    );
  }
}
