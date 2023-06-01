import 'package:flutter/material.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'questions_summery.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choooseAnswer, required this.onRestart});
  final List<String> choooseAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < choooseAnswer.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choooseAnswer[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final questionSummery = getSummeryData();
    final totalQuestions = questions.length;
    final correctAnswers = questionSummery.where((data) {
      return data['user_answer'] == data['correct_answer'];
      
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'You have answered $correctAnswers questions correctly out of $totalQuestions',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
          
              const SizedBox(
                height: 30,
              ),
            QuestionsSummery(questionSummery ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  textAlign: TextAlign.center,
                  'Reset quiz',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 36, 21, 148),
                    foregroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
