import 'package:flutter/material.dart';
import 'package:project_quiz/answer.dart';
import 'package:project_quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final void Function(int) setAnswer;

  const Quiz({
    super.key,
    required this.questions,
    required this.index,
    required this.setAnswer,
  });

  bool get isSelected => index < questions.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        isSelected ? questions[index].cast()['answers'] : [];
    return Column(
      children: <Widget>[
        Question(question: questions[index].cast()['question']),
        ...answers.map(
          (answer) => Answer(
            answer: answer['answer'].toString(),
            onPressed: () => setAnswer(int.parse(answer['point'].toString())),
          ),
        )
      ],
    );
  }
}
