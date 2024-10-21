import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  final String apiKey = "b991dd69562e46f69b2135851242110";
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";
  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception(
          'There seems to be a problem in obtaining the data for this city. Please try again. If the error persists, do not hesitate to contact me!');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    final consolidatedWeather = weatherJson as Map<String, dynamic>;

    final weather = Weather.fromJson(consolidatedWeather);
    return weather;
  }
}
