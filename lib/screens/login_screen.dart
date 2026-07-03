import 'package:flutter/material.dart';
import 'package:quiz_in_2/components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                ],
              ),
              Image.asset('assets/logo.png', width: MediaQuery.of(context).size.width * 0.2,),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
