// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String date;
  final String icon;
  final int maxTemp;
  final int minTemp;

  const SmallCard(
      {super.key,
      required this.date,
      required this.icon,
      required this.maxTemp,
      required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff1d1617).withOpacity(0.11),
                        blurRadius: 40,
                        spreadRadius: 0.0)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text('$maxTempº'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text('$minTempº'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    Text(
                      "$date",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Positioned(
                top: -25,
                left: 15,
                child: Container(
                  width: 90,
                  height: 70,
                  child: Image(image: AssetImage('assets/${icon}.png')),
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
