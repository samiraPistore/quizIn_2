import 'package:flutter/material.dart';
import 'package:quiz_in_2/models/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  Quiz? _selectedQuiz;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  
  //getters para ui acessar
  Quiz? get selectedQuiz => _selectedQuiz;
  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;
  int? get selectedIndex => _selectedIndex;

  Question get currentQuestion =>
      _selectedQuiz!.questions[_currentQuestionIndex];

  bool get isLastQuestion =>
      _currentQuestionIndex == _selectedQuiz!.questions.length - 1;

  double get percentage => (_score / _selectedQuiz!.questions.length) * 100;
  
  void startQuiz(Quiz quiz) {
    _selectedQuiz = quiz;
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedIndex = null;

    notifyListeners();
  }

  void answer(int selectedIndex) {
    if (selectedIndex == currentQuestion.correctIndex) {
      _score++;
    }
  }
 

  void skipQuestion() {
    nextQuestion();
  }

  void nextQuestion() {
    if (!isLastQuestion) {
      _currentQuestionIndex++;
      _selectedIndex = null;
    }

    notifyListeners();
  }

  void selectOption(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
