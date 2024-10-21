// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/pages/widgets/small_card.dart';
import 'package:weather_app/pages/widgets/large_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "New York",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
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
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Upcoming days",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 150,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: [
                  SmallCard(
                      maxTemp: 28,
                      minTemp: 10,
                      date: "10/09/2022",
                      icon: "snow"),
                ],
              ),
            ),
            _clearButton(),
          ],
        ),
      ),
    );
  }

  Padding _clearButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.grey.withOpacity(0.3))),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Clear',
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
