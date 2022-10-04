import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;

  const Result({
    super.key,
    required this.score,
    required this.restartQuiz,
  });

  String get feedbackResult {
    if (score < 8) {
      return 'Parabéns!\nPontuação: $score';
    } else if (score < 12) {
      return 'Você é bom!\nPontuação: $score';
    } else if (score < 16) {
      return 'Impressionante!\nPontuação: $score';
    } else {
      return 'Incrível!\nPontuação: $score';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              feedbackResult,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: restartQuiz,
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
