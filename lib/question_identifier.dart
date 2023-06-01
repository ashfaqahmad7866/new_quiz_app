import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({super.key,required this.isCorrectAnswer,required this.questionIndex });
final bool isCorrectAnswer;
final int questionIndex;
  @override
  Widget build(BuildContext context) {
   final questionNumber=questionIndex+1;
    return Container(
                    width: 30,                  
                    height: 30,margin:const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isCorrectAnswer ?const Color.fromARGB(255, 226, 174, 105):const Color.fromARGB(255, 130, 241, 227)),
                    child: Text(
                      questionNumber.toString(),
                      // ((e['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  );
  }
}