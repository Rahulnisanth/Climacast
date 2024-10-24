import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  final String city;
  final String country;
  final String date;
  final String weatherState;
  final double temperature;
  final double visibility;
  final double humidity;
  final double pressure;
  final double windSpeed;
  const LargeCard(
      {super.key,
      required this.city,
      required this.country,
      required this.date,
      required this.humidity,
      required this.pressure,
      required this.temperature,
      required this.visibility,
      required this.weatherState,
      required this.windSpeed});

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
                    spreadRadius: 0.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 70,
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black),
                          SizedBox(width: 5),
                          Text('$visibility km', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.speed,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text('$pressure hPa', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text('$humidity %', style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.air_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text('$windSpeed mph', style: TextStyle(fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            '$temperatureºC',
                            style: TextStyle(
                                fontSize: 42, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Temperature',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
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
                weatherState,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ],
          ),
        ),
        const Positioned(
          top: -70,
          left: 25,
          child: SizedBox(
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
