// 3.38 hour
import 'package:flutter/material.dart';

import './question.dart';

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
    var questions = ["What\'s your color?", "What\'s your favorite animal?"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(children: [
          if (_questionIndex < 2)
            Question(questions.elementAt(_questionIndex)),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: _answerQuestion,),
          RaisedButton(
              child: Text('Answer 2'),
              onPressed: _answerQuestion),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: _answerQuestion,),
        ],
      ),
    ),
    );
  }
}