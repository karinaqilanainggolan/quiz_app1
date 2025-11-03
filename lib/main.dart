import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/category_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/review_screen.dart';

void main() {
  runApp(const QuizUpApp());
}

class QuizUpApp extends StatelessWidget {
  const QuizUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizUp',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/category': (_) => const CategoryScreen(),
        '/quiz': (_) => const QuizScreen(),
        '/result': (_) => const ResultScreen(),
        '/review': (_) => const ReviewScreen(),
      },
    );
  }
}
