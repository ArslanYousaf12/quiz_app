import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/features/start_quiz/data/questions.dart';
import 'package:quiz_app/features/start_quiz/presentation/widget/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onPressedAnswer});

  final void Function(String answer) onPressedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;

  void _answerQuestion(String answer) {
    widget.onPressedAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...question.shaffleOptions().map((answer) => AnswerButton(
                  text: answer,
                  onPressed: () {
                    _answerQuestion(answer);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
