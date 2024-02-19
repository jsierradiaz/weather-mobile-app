class WeatherData {
  final String cityName;
  double temperature;
  double feelsLike;
  double minTemperature;
  double maxTemperature;
  final String weatherDescription;
  final String icon;
  final int sunrise;
  final int sunset;
  final int humidity;
  final double windSpeed;
  final int windDirection;
  final int pressure;
  final int visibility;
  final int time;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.minTemperature,
    required this.maxTemperature,
    required this.weatherDescription,
    required this.icon,
    required this.sunrise,
    required this.sunset,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.visibility,
    required this.time,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      minTemperature: json['main']['temp_min'],
      maxTemperature: json['main']['temp_max'],
      weatherDescription: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      windDirection: json['wind']['deg'],
      pressure: json['main']['pressure'],
      visibility: json['visibility'],
      time: json['dt'],
    );
  }
}
