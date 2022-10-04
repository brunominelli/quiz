import 'package:flutter/material.dart';
import 'package:project_quiz/quiz.dart';
import 'package:project_quiz/result.dart';

main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;
  int _score = 0;
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': [
        {'answer': 'Ciano', 'point': 5},
        {'answer': 'Amarelo', 'point': 1},
        {'answer': 'Magenta', 'point': 3},
        {'answer': 'Black', 'point': 7},
      ],
    },
    {
      'question': 'Qual é a seu animal favorito?',
      'answers': [
        {'answer': 'Águia', 'point': 1},
        {'answer': 'Lobo', 'point': 7},
        {'answer': 'Urso', 'point': 3},
        {'answer': 'Mamute', 'point': 5},
      ],
    },
    {
      'question': 'Qual é a seu passatempo favorito?',
      'answers': [
        {'answer': 'Jogar', 'point': 7},
        {'answer': 'Ler', 'point': 1},
        {'answer': 'Estudar', 'point': 3},
        {'answer': 'Comer', 'point': 5},
      ],
    },
  ];

  void setAnswer(int point) {
    if (_index < _questions.length) {
      setState(() {
        _index += 1;
        _score += point;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _index = 0;
      _score = 0;
    });
  }

  bool get isSelected => _index < _questions.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: isSelected
            ? Quiz(questions: _questions, index: _index, setAnswer: setAnswer)
            : Result(score: _score, restartQuiz: restartQuiz),
      ),
    );
  }
}
