import 'dart:developer';

import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Quizzler app"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  String current_question = "Press any button to start";
  bool started = false;
  void addIconToList(bool answer) {
    setState(() {
      if (quizBrain.check()) {
        scoreKeeper.add(answer == quizBrain.getAnswer()
            ? Icon(Icons.check, color: Colors.green)
            : Icon(Icons.close, color: Colors.red));
        answer == quizBrain.getAnswer() ? quizBrain.updateScore(1) : null;
        quizBrain.nextQuestion();
        current_question = quizBrain.getQuestion();
        if (!quizBrain.check()) {
          Alert(
            context: context,
            type: AlertType.none,
            title: "Quiz Finished",
            desc: quizBrain.getQuestion(),
            buttons: [
              DialogButton(
                child: Text(
                  "Ok!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          quizBrain.resetQuiz();
        }
      } else {
        Alert(
          context: context,
          type: AlertType.none,
          title: "Quiz Finished",
          desc: quizBrain.getQuestion(),
          buttons: [
            DialogButton(
              child: Text(
                "Ok!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.resetQuiz();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                current_question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                addIconToList(true);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // set the background color
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                addIconToList(false);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // set the background color
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}


/*
question 1 : 'you can lead a cow down stairs but not up stairs.' false,
question 2 : 'Approximately one quarter of human bones are in the feet.' true,
question 3 : 'A slug\'s blood is green.', true,
*/