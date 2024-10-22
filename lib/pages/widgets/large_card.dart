import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({super.key});

  // Global mock data
  static const String weatherCondition = "Heavy Rain";
  static const String temperature = '20ºC';
  static const String distance = '11km';
  static const String pressure = '1,045hPa';
  static const String humidity = '60%';
  static const String windSpeed = '20mph';
  static const String dateLabel = 'Today';

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1d1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              _buildDateLabel(),
              const SizedBox(height: 5),
              _buildWeatherInfo(),
              _buildDivider(),
              _buildWeatherCondition(),
            ],
          ),
        ),
        _buildWeatherImage(),
      ],
    );
  }

  Widget _buildDateLabel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(dateLabel),
        ),
      ],
    );
  }

  Widget _buildWeatherInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWeatherDetail(Icons.remove_red_eye_outlined, distance),
        _buildWeatherDetail(Icons.speed, pressure),
        _buildWeatherDetail(Icons.water_drop_outlined, humidity),
        _buildWeatherDetail(Icons.air_sharp, windSpeed),
        _buildTemperatureInfo(),
      ],
    );
  }

  Widget _buildWeatherDetail(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 5),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildTemperatureInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.thermostat, color: Colors.black, size: 45),
            Text(
              temperature,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text('Temperature', style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _buildWeatherCondition() {
    return const Text(
      weatherCondition,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildWeatherImage() {
    return Positioned(
      top: -70,
      left: 25,
      child: Container(
        height: 200,
        width: 200,
        child: const Image(
          image: AssetImage("assets/snow.png"),
        ),
      ),
    );
  }
}
