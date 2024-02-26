class WeatherForecast {
  final String city;
  final String country;
  final Coord coord;
  final num population;
  final List<ForecastDay> forecast;

  WeatherForecast(
      {required this.city,
      required this.country,
      required this.population,
      required this.coord,
      required this.forecast});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<ForecastDay> forecastList =
        list.map((i) => ForecastDay.fromJson(i)).toList();

    return WeatherForecast(
      city: json['city']['name'],
      country: json['city']['country'],
      coord: Coord.fromJson(json['city']['coord']),
      population: json['city']['population'],
      forecast: forecastList,
    );
  }
}

class ForecastDay {
  final int date;
  final num temperature;
  final num feelsLike;
  final num minTemp;
  final num maxTemp;
  final String main;
  final String description;

  ForecastDay({
    required this.date,
    required this.temperature,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.main,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['dt'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
    );
  }
}

class Coord {
  final double lat;
  final double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
