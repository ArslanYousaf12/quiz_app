import 'package:flutter/material.dart';
import 'package:quiz_app/features/start_quiz/data/questions.dart';
import 'package:quiz_app/features/start_quiz/presentation/question_screen.dart';
import 'package:quiz_app/features/start_quiz/presentation/quiz.dart';
import 'package:quiz_app/features/start_quiz/presentation/result_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var activeScreen = 'startQuiz';
  List<String> choosanAnswers = [];

//TODO: add statemangement solution instread of passing data through widget tree
  void switchScreen() {
    setState(() {
      activeScreen = 'questionScreen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'startQuiz';
      choosanAnswers = [];
    });
  }

  void addAnswer(String answer) {
    setState(() {
      choosanAnswers.add(answer);
      if (choosanAnswers.length == questions.length) {
        activeScreen = 'resultScreen';
        // choosanAnswers = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartQuiz(switchScreen: switchScreen);

    if (activeScreen == 'questionScreen') {
      screenWidget = QuestionScreen(onPressedAnswer: addAnswer);
    }
    if (activeScreen == 'resultScreen') {
      screenWidget = ResultScreen(
        choosanAnswers: choosanAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      theme: ThemeData(
          // * Use this to toggle Material 3 (defaults to true since Flutter 3.16)
          useMaterial3: true,
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // background (button) color
              foregroundColor: Colors.black, // foreground (text) color
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          scaffoldBackgroundColor: Colors.deepPurpleAccent),
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
