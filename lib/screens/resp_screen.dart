import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_in_2/components/custom_appbar.dart';
import 'package:quiz_in_2/providers/auth_provider.dart';
import 'package:quiz_in_2/providers/quiz_provider.dart';
import 'package:quiz_in_2/routes/app_routes.dart';

class RespScreens extends StatelessWidget {
  const RespScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final provider = context.watch<AuthProvider>();

    final question = quiz.currentQuestion;

    int? selectedIndex;

    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           
              CustomAppbar(
                userName: provider.currentUser!.name,
                imagePath: provider.currentUser!.imagePath,
                onLogout: () {
                  provider.logOut();

                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
                },
              ),

            const SizedBox(height: 20),

         
            Text(
              question.statement,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

          
            ...List.generate(question.alternatives.length, (i) {
              return RadioListTile<int>(
  value: i,
  groupValue: quiz.selectedIndex,
  title: Text(question.alternatives[i]),
  onChanged: (value) {
    quiz.selectOption(value!);
  },
);
            }),

            const Spacer(),
        
           ElevatedButton(
  onPressed: quiz.selectedIndex == null
      ? null
      : () {
          final correct =
              quiz.selectedIndex == question.correctIndex;

          quiz.answer(quiz.selectedIndex!);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                correct ? "Acertou!" : "Errou!",
              ),
            ),
          );

          if (quiz.isLastQuestion) {
            Future.delayed(const Duration(milliseconds: 300), () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Resultado"),
                  content: Text(
                    "Você acertou ${quiz.percentage.toStringAsFixed(1)}%",
                  ),
                ),
              );
            });
          }
        },
  child: const Text("Responder"),
),

            const SizedBox(height: 10),


            ElevatedButton(
              onPressed: () {
                quiz.skipQuestion();
              },
              child: const Text("Pular"),
            ),
          ],
        ),
      ),
    );
  }
}