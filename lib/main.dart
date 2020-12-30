// 3.38 hour
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("Answer Chosen!, questionIndex is: $_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText':'What\'s your favorite color?',
        'answer':['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer':['Rabbit','Snake','Elephant', 'Lion'],
      },
      {
        'questionText':'Who\'s your favorite instructor',
        'answer': ['Max', 'Jack', 'Rob', 'Diana'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(children: [
            Question(
                questions[_questionIndex]['questionText']
            ),
            ...(questions[_questionIndex]['answer'] as List<String>).map((
                answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
        ],
      ),
    ),
    );
  }
}