import 'package:flutter/material.dart';
import 'question_identifier.dart';

class SummeryItems extends StatelessWidget {
  const SummeryItems({super.key, required this.summeryData});
  final Map<String, Object> summeryData;
  @override
  Widget build(BuildContext context) {
    final isCorrectAns =
        summeryData['user_answer'] == summeryData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAns,
            questionIndex: summeryData['question_index'] as int),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summeryData['question'] as String,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                summeryData['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 173, 170, 170),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                summeryData['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 132, 193, 204),
                  fontSize: 17,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
