import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Make app full screen and transparent
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );

    // Make status bar and navigation bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A2D3E),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF64FFDA),
            foregroundColor: const Color(0xFF2A2D3E),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
        ),
      ),
      home: Scaffold(
        extendBody: true, // Extend body behind bottom navigation bar
        extendBodyBehindAppBar: true, // Extend body behind app bar
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2A2D3E),
                Color(0xFF212332),
              ],
            ),
          ),
          child: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: screenWidget,
            ),
          ),
        ),
      ),
    );
  }
}
