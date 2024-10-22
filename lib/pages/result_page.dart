import 'package:flutter/material.dart';
import 'package:weather_app/pages/widgets/small_card.dart';
import 'package:weather_app/pages/widgets/large_card.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  "New York",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "United States",
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Weather Card
              const LargeCard(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SmallCard(
                    temp: random.nextInt(10) + 25,
                    condition: [
                      "Rain",
                      "Sunny",
                      "Cloudy",
                      "Windy",
                      "Storm"
                    ][random.nextInt(5)],
                    date: "Oct ${22 + random.nextInt(5)}",
                    icon: [
                      "snow",
                      "sleet",
                      "thunderstorm",
                      "light_rain",
                      "heavy_rain"
                    ][random.nextInt(5)],
                  ),
                  SmallCard(
                    temp: random.nextInt(10) + 25,
                    condition: [
                      "Rain",
                      "Sunny",
                      "Cloudy",
                      "Windy",
                      "Storm"
                    ][random.nextInt(5)],
                    date: "Oct ${22 + random.nextInt(5)}",
                    icon: [
                      "snow",
                      "sleet",
                      "thunderstorm",
                      "light_rain",
                      "heavy_rain"
                    ][random.nextInt(5)],
                  ),
                  SmallCard(
                    temp: random.nextInt(10) + 25,
                    condition: [
                      "Rain",
                      "Sunny",
                      "Cloudy",
                      "Windy",
                      "Storm"
                    ][random.nextInt(5)],
                    date: "Oct ${22 + random.nextInt(5)}",
                    icon: [
                      "snow",
                      "sleet",
                      "thunderstorm",
                      "light_rain",
                      "heavy_rain"
                    ][random.nextInt(5)],
                  ),
                  SmallCard(
                    temp: random.nextInt(10) + 25,
                    condition: [
                      "Rain",
                      "Sunny",
                      "Cloudy",
                      "Windy",
                      "Storm"
                    ][random.nextInt(5)],
                    date: "Oct ${22 + random.nextInt(5)}",
                    icon: [
                      "snow",
                      "sleet",
                      "thunderstorm",
                      "light_rain",
                      "heavy_rain"
                    ][random.nextInt(5)],
                  ),
                  SmallCard(
                    temp: random.nextInt(10) + 25,
                    condition: [
                      "Rain",
                      "Sunny",
                      "Cloudy",
                      "Windy",
                      "Storm"
                    ][random.nextInt(5)],
                    date: "Oct ${22 + random.nextInt(5)}",
                    icon: [
                      "snow",
                      "sleet",
                      "thunderstorm",
                      "light_rain",
                      "heavy_rain"
                    ][random.nextInt(5)],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
