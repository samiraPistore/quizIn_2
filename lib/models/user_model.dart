class User {
  final String name;
  final String email;
  String password;
  final String question;
  final String answer;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.question,
    required this.answer,
  });
}