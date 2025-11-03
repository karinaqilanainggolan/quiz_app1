import 'package:flutter/material.dart';
import '../services/quiz_manager.dart';
import '../widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qm = QuizManager.I;
    final score = qm.score;
    final total = qm.total;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text('Selamat !!!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 8),
            const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
            const SizedBox(height: 24),
            const Text('Skor Kamu :', style: TextStyle(fontSize: 22, color: Colors.white)),
            Text(
              '$score/$total',
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.white),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Lihat Jawaban Yang Benar',
              onPressed: () => Navigator.pushNamed(context, '/review'),
              filled: true,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Coba Lagi',
              onPressed: () {
                qm.resetAll();
                Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
