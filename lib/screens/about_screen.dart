import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {},
              child: Ink(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Weather App ',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'This is a weather forecasting app that provides real-time weather updates. '
                          'It fetches data from the OpenWeather API and presents it in a user-friendly interface. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'OpenWeatherMap API is a service that provides weather data, including current weather data, forecasts, and historical data to the developers of web services and mobile applications. It provides an API with JSON, XML and HTML endpoints and a limited free service.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'This app was created using Flutter. '
                          'Flutter is an open-source UI software development kit created by Google. '
                          'It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Developed by: Juan Pablo Sierra Diaz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
