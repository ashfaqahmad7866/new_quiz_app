// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_quiz_app/answer_button.dart';
import './data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.onSelectAnswer, {super.key});
  void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void changeQuestionIndex(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
        child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 163, 121, 231),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswered().map((e) {
            return AnswerButton(
              e,
              () {
                changeQuestionIndex(e);
              },
            );
          }),
          // AnswerButton(currentQuestion.answers[0], () {}),
          // AnswerButton(currentQuestion.answers[1], () {}),
          // AnswerButton(currentQuestion.answers[2], () {}),
          // AnswerButton(currentQuestion.answers[3], () {}),
        ],
      ),
    ));
  }
}
