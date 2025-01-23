import 'package:flutter/material.dart';
import 'package:quiz_app/features/start_quiz/data/questions.dart';
import 'package:quiz_app/features/start_quiz/presentation/widget/summary_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosanAnswers, required this.restartQuiz});
  final List<String> choosanAnswers;
  final VoidCallback restartQuiz;

  //TODO: Implement getsummary model instread of model
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
    final getSummaryData = getsummary();
    final totalQuestions = questions.length;
    final correctAnswers = getSummaryData
        .where(
            (element) => element['correct_answer'] == element['choosan_answer'])
        .length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $correctAnswers out of $totalQuestions questions correctly!'),
              const SizedBox(
                height: 30,
              ),
              SummaryData(getSummaryData),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: restartQuiz, child: Text('Restart Quiz'))
            ],
          ),
        ));
  }
}
