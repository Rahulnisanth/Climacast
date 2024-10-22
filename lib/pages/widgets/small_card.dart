import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  // Global mock data
  final String date;
  final String icon;
  final String condition;
  final int temp;

  const SmallCard({
    super.key,
    required this.date,
    required this.icon,
    required this.temp,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextSection(),
          _buildIcon(),
          _buildTemperature(),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Weather condition
        Text(
          condition,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        // Date
        Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Image.asset('assets/$icon.png'),
    );
  }

  Widget _buildTemperature() {
    return Text(
      '$temp ºC',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
