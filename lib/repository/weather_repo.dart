// Place to fetch the weather data from the API and parse it into a Weather object
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import '../model/weather_model.dart';
import 'dart:convert';

class WeatherRepo {
  Future<Weather> getWeather(String city) async {
    const String baseUrl = "http://192.168.1.87:3000/get";
    var client = Dio();
    var response = await client.post(baseUrl, data: {"city": city});
    print(response.data);
    if (response.statusCode == 200) {
      print(
          "Program reached weather repo & triggered the API call with response data => ${response.data}");
      var consolidatedData = jsonDecode(response.data) as Map<String, dynamic>;
      var finalWeather = Weather.fromJson(consolidatedData);
      return finalWeather;
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }
}
