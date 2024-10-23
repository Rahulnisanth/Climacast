// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/weather_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String welcomeAnimationPath = 'assets/welcome.json';
  static const String searchHintText = 'Search city';
  static const String gettingStartedText = 'Getting Started';
  static const String climacastProText = 'Climacast Pro';
  static const String instructionText =
      'Type the name of the city using the above search bar and get the weather';

  // Text editing controller for the city name
  final TextEditingController cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(WeatherController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            _searchField(),
            const SizedBox(height: 20),
            _homepage(),
          ],
        ),
      ),
    );
  }

  Column _homepage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Lottie.asset(welcomeAnimationPath),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    gettingStartedText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    climacastProText,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    instructionText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1d1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cityNameController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/Search.svg'),
                ),
                hintText: searchHintText,
                hintStyle: const TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.all(12),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () async {
              final city = cityNameController.text.trim();
              if (city.isNotEmpty) {
                final WeatherController weatherController = Get.find();
                try {
                  await weatherController.getWeather(city);
                  Get.toNamed("/result_page");
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text(
                        'Error occurred',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Error occurred while fetching weather data. Retry with correct city name',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }
              } else {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text(
                      'Error occurred',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Please enter a valid city name',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1d1617).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                child: Text(
                  "Go",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
