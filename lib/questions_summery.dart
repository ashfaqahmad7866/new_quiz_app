import 'package:flutter/material.dart';
import 'package:new_quiz_app/summery_items.dart';

class QuestionsSummery extends StatelessWidget {
 const  QuestionsSummery(this.summeryData, {super.key});
  final List<Map<String, Object>> summeryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summeryData.map(
            (e) {
              return SummeryItems(summeryData: e);
            },
          ).toList(),
        ),
      ),
    );
  }
}
