import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_mobile_app/models/weather_data.dart';
import 'package:weather_mobile_app/services/location_service.dart';
import 'package:weather_mobile_app/services/secrets.dart';
import 'package:weather_mobile_app/services/weather_service.dart';
import 'package:weather_mobile_app/widgets/current_weather.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String apiKey = Secrets.openWeatherAPI;
  LocationService locationService = LocationService();
  WeatherService? weatherService;

  WeatherData weatherData = WeatherData(
    cityName: '',
    temperature: 0,
    feelsLike: 0,
    minTemperature: 0,
    maxTemperature: 0,
    weatherDescription: '',
    icon: '',
  );

  @override
  void initState() {
    super.initState();
    weatherService = WeatherService(apiKey);
    getWeatherData();
  }

  void getWeatherData() async {
    LocationData? locationData = await locationService.getLocation();

    if (locationData != null) {
      WeatherData? weatherData = await weatherService?.getWeatherData(
          locationData.latitude!, locationData.longitude!);

      setState(() {
        this.weatherData = weatherData!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          weatherData.cityName,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CurrentWeather(weather: weatherData),
            ],
          ),
        ),
      ),
    );
  }
}
