import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [_searchField(), _homepage()]));
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
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Getting Started',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Climacast Pro',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Type the name of the city using above search bar and get the weather',
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/Search.svg'),
                  ),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    color: Color(0xffDDDADA),
                    fontSize: 18,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            )),
            TextButton(
                onPressed: () {
                  print(searchController.text);
                  if (searchController.text.isNotEmpty) {
                    Navigator.pushNamed(context, "/result_page");
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('Error occurred'),
                        content: Text(
                            'Error occurred while fetching weather data. Retry with correct city name'),
                      ),
                    );
                  }
                  setState(() {
                    searchController.clear();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff1d1617).withOpacity(0.11),
                            blurRadius: 40,
                            spreadRadius: 0.0)
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    child: Text(
                      "Go",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                )),
          ],
        ));
  }
}