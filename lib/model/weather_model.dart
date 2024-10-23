// Place to define the weather data model as dart objects
class Weather {
  Weather({
    required this.city,
    required this.country,
    required this.date,
    required this.weatherState,
    required this.temperature,
    required this.visibility,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double temperature;
  final double visibility;
  final double humidity;
  final double pressure;
  final double windSpeed;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      // Change the deserialization of the JSON data to the dart objects according to the response data received from the API
      city: json['city'],
      country: json['country'],
      date: json['date'],
      weatherState: json['weatherState'],
      temperature: json['temperature'],
      visibility: json['visibility'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      windSpeed: json['windSpeed'],
    );
  }
}

class NextDays {
  NextDays({
    required this.city,
    required this.country,
    required this.date,
    required this.weatherState,
    required this.temperature,
    required this.visibility,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double temperature;
  final double visibility;
  final double humidity;
  final double pressure;
  final double windSpeed;
}
