import 'package:flutter/material.dart';
import 'package:quiz_in_2/components/quiz_card.dart';
import 'package:quiz_in_2/data/quiz_data.dart';


class QuizList extends StatelessWidget {
  const QuizList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        return QuizCard(
          quiz: quizzes[index],
        );
      },
    );
  }
}