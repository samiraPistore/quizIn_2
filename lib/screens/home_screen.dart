import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset('assets/logo.png'),
                  ),
          
                  Column(
                    children: [
                      Text(provider.currentUser!.name),
                      TextButton(
                        onPressed: () {
                          provider.logOut();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.login,
                            (route) => false,
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(provider.currentUser!.imagePath),
                  ),
                ],
              ),
          
              Text('QUIZES'),

              QuizList()
            ],
          ),
        ),
      ),
    );
  }
}
