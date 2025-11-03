import 'package:flutter/material.dart';
import 'package:quiz_app/%20core/styles.dart';
import 'package:quiz_app/core/styles.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: Icon(Icons.lightbulb_outline, size: 42, color: AppColors.primary),
              ),
              SizedBox(height: 28),
              Text('QuizUp!', style: TextStyle(
                  color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900))
            ],
          ),
        ),
      ),
    );
  }
}
