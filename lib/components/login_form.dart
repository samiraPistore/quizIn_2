import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  //função submeter form
  void sbmmitForm() {
    if (!_formKey.currentState!.validate()) return;

    //cosumindo provider
    final result = context.read<AuthProvider>().login(
      email: _emailController.text.trim(),
      password: _senhaController.text,
    );

    if (result == LoginResult.success) {

      Navigator.of(context).pushNamedAndRemoveUntil( AppRoutes.home,(route) => false,);
      print('sucess');
    } else if (result == LoginResult.invalidCredentials) {
      _showError('Ambas as informações estão incorretas');
    } else if (result == LoginResult.wrongPassword) {
      _showError('Senha incorreta');
    } else if (result == LoginResult.temporaryBlocked) {
      _showError('Login bloqueado temporariamente');
    } else if (result == LoginResult.userBlocked) {
      _showError('Usuário bloqueado');
    } else if (result == LoginResult.temporaryBlocked) {}
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Image.asset('assets/logo.png'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o pop-up
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
