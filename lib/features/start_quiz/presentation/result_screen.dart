import 'package:flutter/material.dart';
import 'package:quiz_app/features/start_quiz/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosanAnswers});
  final List<String> choosanAnswers;
  List<Map<String, Object>> getsummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosanAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].question,
        'correct_answer': questions[i].options[0],
        'choosan_answer': choosanAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Congratulations! You answer x out y',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('List of answers'),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Restart Quiz'))
            ],
          ),
        ));
  }
}
