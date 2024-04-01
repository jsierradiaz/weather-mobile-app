import 'package:flutter/material.dart';
import 'package:weather_mobile_app/models/weather_forecast.dart';
import 'package:weather_mobile_app/widgets/weather/date_formatter.dart';

class Forecast extends StatefulWidget {
  const Forecast({
    super.key,
    required this.weatherForecast,
  });

  final WeatherForecast weatherForecast;

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    // print(widget.weatherForecast.forecast[0].date);

    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.weatherForecast.forecast.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: Theme.of(context).colorScheme.primary,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatEpochTime(
                              widget.weatherForecast.forecast[index].date),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${widget.weatherForecast.forecast[index].temperature}° F',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.weatherForecast.forecast[index].main,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.weatherForecast.forecast[index].description,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Feels like ${widget.weatherForecast.forecast[index].feelsLike}° F',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
