class Quiz {
  final String title;
  final String date;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.date,
    required this.questions,
  });
}


class Question {
  final String statement;
  final List<String> alternatives;
  final int correctIndex;

  Question({
    required this.statement,
    required this.alternatives,
    required this.correctIndex,
  });
}