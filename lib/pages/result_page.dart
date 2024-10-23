import 'package:flutter/material.dart';
import 'package:weather_app/pages/widgets/small_card.dart';
import 'package:weather_app/pages/widgets/large_card.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  // Global mock data
  static const List<String> conditions = [
    "Rain",
    "Sunny",
    "Cloudy",
    "Windy",
    "Storm"
  ];

  static const List<String> icons = [
    "snow",
    "sleet",
    "thunderstorm",
    "light_rain",
    "heavy_rain"
  ];

  static const String cityName = "New York";
  static const String countryName = "United States";

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 15),
              _buildCityInfo(),
              const SizedBox(height: 15),
              const LargeCard(),
              const SizedBox(height: 20),
              _buildWeatherForecast(random),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            cityName,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            countryName,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherForecast(Random random) {
    return Column(
      children: List.generate(5, (index) {
        return SmallCard(
          temp: random.nextInt(10) + 25,
          condition: conditions[random.nextInt(conditions.length)],
          date: "Oct ${22 + random.nextInt(5)}",
          icon: icons[random.nextInt(icons.length)],
          humidity: random.nextInt(100),
          pressure: random.nextInt(1000),
          visibility: random.nextInt(100),
          windSpeed: random.nextInt(100),
        );
      }),
    );
  }
}
