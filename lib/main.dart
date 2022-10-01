import 'package:flutter/material.dart';
import 'package:project_quiz/question.dart';
import 'package:project_quiz/answer.dart';

main() {
  runApp(const Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _questionIndex = 0;
  List<Map<String, Object>> questions = [
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': ['Ciano', 'Amarelo', 'Magenta', 'Black'],
    },
    {
      'question': 'Qual é a seu animal favorito?',
      'answers': ['Águia', 'Lobo', 'Urso', 'Mamute'],
    },
    {
      'question': 'Qual é a seu passatempo favorito?',
      'answers': ['Jogar', 'Ler', 'Estudar', 'Comer'],
    },
  ];

  void setIndex() {
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = questions[_questionIndex].cast()['answers'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Column(
          children: [
            Question(question: '${questions[_questionIndex]['question']}'),
            ...answers
                .map((answer) => Answer(answer: answer, onPressed: setIndex))
                .toList(),
          ],
        ),
      ),
    );
  }
}
