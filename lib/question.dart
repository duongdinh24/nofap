import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(
          questionText,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        )
    );
  }
}
