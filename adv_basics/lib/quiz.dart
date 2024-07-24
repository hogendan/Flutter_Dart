import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

enum ScreenTypes {
  startScreen,
  questionsScreen,
}

class _QuizState extends State<Quiz> {
  var activeScreen = ScreenTypes.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = ScreenTypes.questionsScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 76, 32, 199),
              Color.fromARGB(255, 76, 32, 199)
            ], begin: Alignment.topLeft),
          ),
          child: activeScreen == ScreenTypes.startScreen
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}
