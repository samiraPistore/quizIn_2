import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String message;
  const PopUp( {Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
