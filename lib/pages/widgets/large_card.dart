// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff1d1617).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text('Today'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_upward, color: Colors.black),
                          const SizedBox(width: 5),
                          Text('20º', style: const TextStyle(fontSize: 24))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.arrow_downward, color: Colors.black),
                          const SizedBox(width: 5),
                          Text('20º', style: const TextStyle(fontSize: 24))
                        ],
                      )
                    ],
                  ),
                  Text(
                    '20º',
                    style: const TextStyle(fontSize: 90),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              Text(
                "Heavy Rain",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Positioned(
          top: -70,
          left: 10,
          child: Container(
            height: 200,
            width: 200,
            child: Image(
              image: AssetImage("assets/snow.png"),
            ),
          ),
        )
      ],
    );
  }
}
