import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_in_2/components/pop_up.dart';
import 'package:quiz_in_2/providers/auth_provider.dart';
import 'package:quiz_in_2/routes/app_routes.dart';
import 'package:quiz_in_2/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void sbmmitForm() {
    if (!_formKey.currentState!.validate()) return;

    final result = context.read<AuthProvider>().login(
      email: _emailController.text.trim(),
      password: _senhaController.text,
    );

    if (result == LoginResult.success) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } else if (result == LoginResult.invalidCredentials) {
      PopUp(message: 'Ambas as informações estão incorretas');
     
    } else if (result == LoginResult.wrongPassword) {
       PopUp(message:'Senha incorreta');
    } else if (result == LoginResult.temporaryBlocked) {
       PopUp(message:'Login bloqueado temporariamente');
    } else if (result == LoginResult.userBlocked) {
       PopUp(message:'Usuário bloqueado');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Email'),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Color(0xFF333333)),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o email';
                }
                return null;
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Senha'),
                TextFormField(
                  controller: _senhaController,
                  style: const TextStyle(color: Color(0xFF333333)),
                
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a senha';
                    }
                    return null;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: sbmmitForm, child: const Text('Entrar')),
          ],
        ),
      ),
    );
  }
}
