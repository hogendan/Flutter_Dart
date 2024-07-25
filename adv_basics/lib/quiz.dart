import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

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
  resultsScreen,
}

class _QuizState extends State<Quiz> {
  var activeScreen = ScreenTypes.startScreen;
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = ScreenTypes.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ScreenTypes.resultsScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == ScreenTypes.startScreen) {
      screenWidget = StartScreen(switchScreen);
    }

    if (activeScreen == ScreenTypes.questionsScreen) {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == ScreenTypes.resultsScreen) {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 76, 32, 199),
              Color.fromARGB(255, 76, 32, 199)
            ], begin: Alignment.topLeft),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
