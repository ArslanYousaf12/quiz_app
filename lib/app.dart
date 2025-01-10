import 'package:flutter/material.dart';
import 'package:quiz_app/features/start_quiz/presentation/question_screen.dart';
import 'package:quiz_app/features/start_quiz/presentation/quiz.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartQuiz(
      switchScreen: switchScreen,
    );
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Colors.black, // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          scaffoldBackgroundColor: Colors.deepPurpleAccent),
      home: Scaffold(body: activeScreen),
    );
  }
}
