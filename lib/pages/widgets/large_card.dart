import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({super.key});

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
                    width: 5,
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
              const Row(
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
                          Text('11km', style: TextStyle(fontSize: 16))
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
                          Text('1,045hPa', style: TextStyle(fontSize: 16))
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
                          Text('60%', style: TextStyle(fontSize: 16))
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
                          Text('20mph', style: TextStyle(fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thermostat,
                            color: Colors.black,
                            size: 45,
                          ),
                          Text(
                            '20ºC',
                            style: TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Temperature',
                        style: TextStyle(fontSize: 18),
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
              const Text(
                "Heavy Rain",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          top: -70,
          left: 25,
          child: Container(
            height: 200,
            width: 200,
            child: const Image(
              image: AssetImage("assets/snow.png"),
            ),
          ),
        )
      ],
    );
  }
}
