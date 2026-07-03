import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_in_2/components/custom_appbar.dart';
import 'package:quiz_in_2/components/quiz_list.dart';
import 'package:quiz_in_2/providers/auth_provider.dart';
import 'package:quiz_in_2/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    if (provider.currentUser == null) {
      return const Scaffold(
        body: Center(child: Text('Usuário não encontrado')),
      );
    }

    return Scaffold(
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
      
            Text('QUIZES'),
      
            QuizList(),
          ],
        ),
      ),
    );
  }
}
