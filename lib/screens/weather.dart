import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Weather',
            ),
          ],
        ),
      ),
    );
  }
}
