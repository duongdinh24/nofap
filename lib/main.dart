// 3.38 hour
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State <MyApp>{
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print("Answer Chosen!, questionIndex is: $questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What\'s your color?",
      "What\'s your favorite animal?"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(children:[
           if (questionIndex < 2)
             Text(questions.elementAt(questionIndex)),
        RaisedButton(
          child: Text('Answer 1'),
          onPressed: answerQuestion,),
        RaisedButton(
            child: Text('Answer 2'),
            onPressed: answerQuestion),
        RaisedButton(
          child: Text('Answer 3'),
          onPressed: answerQuestion,),
        ],
      ),
    ),
    );
  }
}