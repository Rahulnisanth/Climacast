// ignore_for_file: avoid_print, unused_import
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/pages/widgets/result.dart';
import 'package:weather_app/pages/widgets/error.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      _searchField(),
      _homepage(),
      // const ResultPage(),
      // const ErrorPage(
      //     errorMessage: "Error fetching data with the given city name")
    ]));
  }

  // ignore: unused_element
  Column _homepage() {
    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Lottie.asset('assets/welcome.json'),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'The Climacast App',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Search for the weather of any city in the world',
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
    var searchController = TextEditingController();
    return Container(
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xff1d1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0)
        ]),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    color: Color(0xffDDDADA),
                    fontSize: 18,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/Search.svg')),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Adding the fetch the weather data
                      print(searchController.text);
                      setState(() {
                        searchController.clear();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset('assets/sender.png'),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            )),
          ],
        ));
  }
}
