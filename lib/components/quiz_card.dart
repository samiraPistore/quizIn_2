import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_in_2/models/quiz_model.dart';
import 'package:quiz_in_2/providers/quiz_provider.dart';
import 'package:quiz_in_2/routes/app_routes.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<QuizProvider>().startQuiz(quiz);

        Navigator.pushNamed(context, AppRoutes.respostas, arguments: quiz);
      },
      child: Card(
        child: ListTile(
          title: Text(quiz.title),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(quiz.date),
            ],
          ),
        ),
      ),
    );
  }
}
