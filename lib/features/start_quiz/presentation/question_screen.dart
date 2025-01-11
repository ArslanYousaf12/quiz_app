import 'package:flutter/material.dart';
import 'package:quiz_app/features/start_quiz/presentation/widget/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What are the main building blocks of Flutter UIs?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 20),
          AnswerButton(text: 'Widgets', onPressed: () {}),
          AnswerButton(text: 'Components', onPressed: () {}),
          AnswerButton(text: 'Blocks', onPressed: () {}),
          AnswerButton(text: 'Functions', onPressed: () {}),
        ],
      ),
    );
  }
}
