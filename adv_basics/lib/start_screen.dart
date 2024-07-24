import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: const Color.fromARGB(150, 255, 255, 255),
          width: 500,
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Color.fromARGB(255, 196, 176, 200),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start Quiz',
          ),
        )
      ],
    );
  }
}
