import 'package:flutter/material.dart';
import 'package:quiz_in_2/models/user_model.dart';
import 'package:quiz_in_2/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;

  LoginResult login({
    required String email,
    required String password,
  }) {
    final result = AuthService.login(
      email: email,
      password: password,
    );

    if (result == LoginResult.success) {
      _currentUser = AuthService.findByEmail(email);
      notifyListeners();
    }

    return result;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}