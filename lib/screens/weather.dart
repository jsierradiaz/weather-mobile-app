import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_mobile_app/models/weather_data.dart';
import 'package:weather_mobile_app/models/weather_forecast.dart';
import 'package:weather_mobile_app/services/location_service.dart';
import 'package:weather_mobile_app/services/secrets.dart';
import 'package:weather_mobile_app/services/weather_service.dart';
import 'package:weather_mobile_app/widgets/city_details.dart';
import 'package:weather_mobile_app/widgets/current_weather.dart';
import 'package:weather_mobile_app/widgets/forecast.dart';
import 'package:weather_mobile_app/widgets/main_drawer.dart';
import 'package:weather_mobile_app/widgets/weather_details.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  String apiKey = Secrets.openWeatherAPI;
  LocationService locationService = LocationService();
  WeatherService? weatherService;
  WeatherForecast weatherForecast = WeatherForecast(
      city: '',
      country: '',
      coord: Coord(lat: 0, lon: 0),
      population: 0,
      forecast: []);

  WeatherData weatherData = WeatherData(
    cityName: '',
    temperature: 0,
    feelsLike: 0,
    minTemperature: 0,
    maxTemperature: 0,
    weatherDescription: '',
    main: '',
    icon: '',
    sunrise: 0,
    sunset: 0,
    humidity: 0,
    windSpeed: 0,
    windDirection: 0,
    pressure: 0,
    visibility: 0,
    time: 0,
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
      WeatherForecast? weatherForecast = await weatherService
          ?.getWeatherForecast(locationData.latitude!, locationData.longitude!);

      setState(() {
        this.weatherData = weatherData!;
        this.weatherForecast = weatherForecast!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Text(
              weatherData.cityName,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const Icon(Icons.location_on_outlined),
          ],
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        // ),
      ),
      drawer: MainDrawer(),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          getWeatherData();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CurrentWeather(weather: weatherData),
                      const SizedBox(height: 20),
                      Forecast(
                        weatherForecast: weatherForecast,
                      ),
                      const SizedBox(height: 20),
                      WeatherDetails(weatherData: weatherData),
                      const SizedBox(height: 20),
                      CityDetails(
                        city: weatherForecast.city,
                        country: weatherForecast.country,
                        coord: weatherForecast.coord,
                        population: weatherForecast.population,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
