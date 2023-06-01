import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  @override
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? currentScreen;
  //@override
  // void initState() {
  //  currentScreen=StartScreen(switchingScreen);
  //   super.initState();
  // }
  var currentScreen = 'current-screen';
  List<String> selectedAnswer = [];
  void switchingScreen() {
    setState(() {
      // currentScreen=const QuestionsScreen();
      currentScreen = 'questions-screen';
    });
  }
   void restartQuiz()
   {
    setState(() {
       selectedAnswer = [];
       currentScreen = 'questions-screen';
      
    });
   }
  void choooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchingScreen);
    if (currentScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(choooseAnswer);
    }
    if (currentScreen == 'results-screen') {
      screenWidget =  ResultsScreen(choooseAnswer: selectedAnswer,onRestart:restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 33, 31, 141),
              Color.fromARGB(255, 36, 21, 148),
             
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          // child: currentScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
