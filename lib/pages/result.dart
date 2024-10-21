import 'package:flutter/material.dart';

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
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "BERLIN",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "Germany",
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.black),
                                  SizedBox(width: 5),
                                  Text('19º', style: TextStyle(fontSize: 24))
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.arrow_downward,
                                      color: Colors.black),
                                  SizedBox(width: 5),
                                  Text('19º', style: TextStyle(fontSize: 24))
                                ],
                              )
                            ],
                          ),
                          Text(
                            '20º',
                            style: TextStyle(fontSize: 90),
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
                      const Text(
                        "Heavy Rain",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
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
                    child: const Image(
                      image: AssetImage('assets/showers.png'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            const Padding(
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
                  _nextDaysCard(),
                  _nextDaysCard(),
                  _nextDaysCard(),
                  _nextDaysCard(),
                  _nextDaysCard(),
                  _nextDaysCard()
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

  Container _nextDaysCard() {
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text('24º'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text('18º'),
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
                    const Text(
                      "10/02/2022",
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
                  child: const Image(image: AssetImage('assets/hail.png')),
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
