import 'package:flutter/material.dart';
import 'package:quiz_app/%20core/styles.dart';
import 'package:quiz_app/core/styles.dart';
import '../services/quiz_manager.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text('Ayo Uji\nPengetahuanmu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
            const Spacer(),
            const Icon(Icons.calculate_outlined, size: 96, color: Colors.white),
            const Spacer(),
            TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.words,
              style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                hintText: 'NAMA ANDA',
                hintStyle: const TextStyle(
                    color: AppColors.textDark, fontWeight: FontWeight.w800, letterSpacing: .8),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Mulai',
              filled: true,
              onPressed: () {
                final name = _controller.text.trim().isEmpty ? 'Pengguna' : _controller.text.trim();
                QuizManager.I.playerName = name;
                Navigator.pushNamed(context, '/category');
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
