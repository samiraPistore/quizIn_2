import 'package:quiz_in_2/data/user_data.dart';
import 'package:quiz_in_2/models/user_model.dart';

enum LoginResult {
  success,
  invalidCredentials,
  wrongPassword,
  temporaryBlocked,
  userBlocked,
}

class AuthService {
  static final List<User> _users = List<User>.from(users);

  static User? findByEmail(String email) {
    for (final user in _users) {
      if (user.email.toLowerCase() == email.toLowerCase()) {
        return user;
      }
    }

    return null;
  }

  static LoginResult login({required String email, required String password}) {
    final user = findByEmail(email);

    if (user == null) {
      return LoginResult.invalidCredentials;
    }

    if (user.password != password) {
      return LoginResult.wrongPassword;
    }
    
    return LoginResult.success;
  }

}
