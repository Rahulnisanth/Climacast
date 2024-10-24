import 'package:flutter/material.dart';
// import 'package:weather_app/pages/widgets/small_card.dart';
import 'package:weather_app/pages/widgets/large_card.dart';
import 'package:get/get.dart';
import '../controller/weather_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.15),
        elevation: 4,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Climacast Pro',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            Icon(Icons.cloud, size: 30),
          ],
        ),
      ),
      body: Obx(() {
        final weather = weatherController.weather.value;
        if (weather == null) {
          return AnimatedSplashScreen(
            splash: Lottie.asset('assets/welcome.json'),
            splashIconSize: 250,
            nextScreen: const ResultPage(),
            splashTransition: SplashTransition.fadeTransition,
            duration: 3000,
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 15),
                _buildCityInfo(weather),
                const SizedBox(height: 15),
                LargeCard(
                    city: weather.city,
                    country: weather.country,
                    date: weather.date,
                    humidity: weather.humidity,
                    pressure: weather.pressure,
                    temperature: weather.temperature,
                    visibility: weather.visibility,
                    weatherState: weather.weatherState,
                    windSpeed: weather.windSpeed),
                const SizedBox(height: 20),
                // _buildWeatherForecast(random),
                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCityInfo(weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(
            weather.city,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            weather.country,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  // Widget _buildWeatherForecast(Random random) {
  //   return Column(
  //     children: List.generate(5, (index) {
  //       return SmallCard(
  //         temp: random.nextInt(10) + 25,
  //         condition: conditions[random.nextInt(conditions.length)],
  //         date: "Oct ${22 + random.nextInt(5)}",
  //         icon: icons[random.nextInt(icons.length)],
  //         humidity: random.nextInt(100),
  //         pressure: random.nextInt(1000),
  //         visibility: random.nextInt(100),
  //         windSpeed: random.nextInt(100),
  //       );
  //     }),
  //   );
  // }
}
