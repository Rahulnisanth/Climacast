import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/pages/result_page.dart';
import 'pages/home_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Climacast App',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset('assets/welcome.json'),
        splashIconSize: 250,
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
      routes: {"/result_page": (_) => const ResultPage()},
    );
  }
}
