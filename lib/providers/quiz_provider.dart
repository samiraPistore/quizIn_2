import 'package:flutter/material.dart';
import 'package:quiz_in_2/models/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  Quiz? _selectedQuiz;
  int _currentQuestionIndex = 0;
  int _score = 0;

  Quiz? get selectedQuiz => _selectedQuiz;

  int get score => _score;

  int get currentQuestionIndex => _currentQuestionIndex;

  Question get currentQuestion =>
      _selectedQuiz!.questions[_currentQuestionIndex];

  bool get isLastQuestion =>
      _currentQuestionIndex == _selectedQuiz!.questions.length - 1;

  double get percentage => (_score / _selectedQuiz!.questions.length) * 100;

  void startQuiz(Quiz quiz) {
    _selectedQuiz = quiz;
    _currentQuestionIndex = 0;
    _score = 0;

    notifyListeners();
  }

  void answer(int selectedIndex) {
    if (selectedIndex == currentQuestion.correctIndex) {
      _score++;
    }

    nextQuestion();
  }

  void skipQuestion() {
    nextQuestion();
  }

  void nextQuestion() {
    if (!isLastQuestion) {
      _currentQuestionIndex++;
    }

    notifyListeners();
  }

  int? _selectedIndex;

int? get selectedIndex => _selectedIndex;

void selectOption(int index) {
  _selectedIndex = index;
  notifyListeners();
}
}
