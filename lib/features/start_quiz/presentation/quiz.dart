import 'package:flutter/material.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.1,
        vertical: height * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            fit: BoxFit.cover,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: height / 1 * 0.1),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
