import 'package:flutter/material.dart';
import 'package:quiz_in_2/models/quiz_model.dart';
import 'package:quiz_in_2/routes/app_routes.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(
          AppRoutes.respostas,
          arguments: quiz,
        );
      },
      child: Card(
        child: ListTile(
          title: Text(quiz.title),
          subtitle: Text(quiz.date),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}