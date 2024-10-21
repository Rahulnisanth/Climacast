import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Lottie.asset('assets/error-animation.json')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    'Something went wrong',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    errorMessage.replaceAll('Exception:', ''),
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
}
