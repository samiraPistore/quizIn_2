import 'package:flutter/material.dart';
import 'package:quiz_in_2/data/app_routes.dart';
import 'package:quiz_in_2/screens/login_screen.dart';
import 'package:quiz_in_2/screens/rec_senha_screen.dart';
import 'package:quiz_in_2/screens/resp_screen.dart';
import 'package:quiz_in_2/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF0084AD),
          secondary: Color(0xFF003764),
          onSurface: Color(0xFFF7F7F7),
        ),
        scaffoldBackgroundColor: Color(0xFFEDEDED),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Color(0xFF333333))),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (ctx) => SplashScreen(),
        AppRoutes.login: (ctx) => LoginScreen(),
        AppRoutes.resSenha: (ctx) => RecSenhaScreen(),
        AppRoutes.respostas: (ctx) => RespScreens(),
      },
    );
  }
}
