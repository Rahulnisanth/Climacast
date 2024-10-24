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

  // Factory constructor to create a Weather object from JSON
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'] as String,
      country: json['country'] as String,
      date: json['date'] as String,
      weatherState: json['weatherState'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );
  }

  // Static method to parse a list of weather data
  static List<Weather> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Weather.fromJson(json)).toList();
  }
}
