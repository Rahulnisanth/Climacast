// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SmallCard extends StatefulWidget {
  // Global mock data
  final String date;
  final String icon;
  final String condition;
  final int temp;
  final int humidity;
  final int pressure;
  final int visibility;
  final int windSpeed;

  const SmallCard({
    super.key,
    required this.date,
    required this.icon,
    required this.temp,
    required this.condition,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.windSpeed,
  });

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
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
            ),
          ),
          if (_isExpanded) _buildAccordionContent(),
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
          widget.condition,
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
          widget.date,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Image.asset('assets/${widget.icon}.png'),
    );
  }

  Widget _buildTemperature() {
    return Text(
      '${widget.temp} ºC',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildAccordionContent() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAccordionRow('Humidity', '${widget.humidity}%'),
          const SizedBox(height: 5),
          _buildAccordionRow('Pressure', '${widget.pressure} hPa'),
          const SizedBox(height: 5),
          _buildAccordionRow('Visibility', '${widget.visibility} km'),
          const SizedBox(height: 5),
          _buildAccordionRow('Wind Speed', '${widget.windSpeed} km/h'),
        ],
      ),
    );
  }

  Widget _buildAccordionRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
