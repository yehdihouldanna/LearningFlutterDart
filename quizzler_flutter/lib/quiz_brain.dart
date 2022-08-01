import 'package:quizzler_flutter/main.dart';

import 'question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(question: "On earth there are 7 continents", answer: true),
    Question(question: "There are 5 oceans in the world", answer: false),
    Question(
        question: "Yellow is the result of mergin red and green", answer: true),
    Question(question: "The sky is purple", answer: false),
    Question(question: "Fishes can fly", answer: false),
    Question(question: "You are awsome", answer: true),
    Question(question: "The world is full of bullshit", answer: true),
    Question(
        question: "Usain Bolt has the world record for human speed",
        answer: true),
  ];

  int _index = 0;
  int _score = 0;

  void resetQuiz() {
    _index = 0;
    _score = 0;
  }

  String getQuestion() {
    return _index != -1
        ? _questions[_index].question
        : "You have answered all the questions your score is $_score out of ${_questions.length}";
  }

  bool getAnswer() {
    return _index != -1 ? _questions[_index].answer : true;
  }

  void nextQuestion() {
    (_index != -1 && _index < _questions.length - 1) ? _index++ : _index = -1;
    print(_index);
  }

  updateScore(int value) {
    _index != -1 ? _score += value : null;
  }

  bool check() {
    return _index == -1 ? false : true;
  }
}
