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
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF6750A4),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6750A4),
                Color(0xFF9780D9),
              ],
            ),
          ),
          child: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: screenWidget,
            ),
          ),
        ),
      ),
    );
  }
}

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key, required this.switchScreen});
  final void Function() switchScreen;

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/quiz-logo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Master Flutter',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Test your knowledge with our interactive quiz!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton.icon(
                    onPressed: widget.switchScreen,
                    icon: const Icon(Icons.play_arrow_rounded, size: 28),
                    label: const Text(
                      'Start Quiz',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
