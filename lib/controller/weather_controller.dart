// Place to define the controller for the search page and pass the parsed data to the UI
// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../model/weather_model.dart';
import '../repository/weather_repo.dart';

class WeatherController extends GetxController {
  final WeatherRepo weatherRepo = WeatherRepo();
  var weather = Rx<Weather?>(null);

  Future<void> getWeather(String city) async {
    print(
        'Program reached weather controller & triggered the getWeather function');
    weather.value = await weatherRepo.getWeather(city);
  }
}
