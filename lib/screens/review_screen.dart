import 'package:flutter/material.dart';
import 'package:quiz_app/%20core/styles.dart';
import 'package:quiz_app/core/styles.dart';
import '../services/quiz_manager.dart';
import '../widgets/option_tile.dart';
import '../widgets/progress_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final qm = QuizManager.I;
    final q = qm.currentList[qm.index];
    final chosen = qm.chosen[qm.index];

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuizProgressBar(index: qm.index, total: qm.total),
            const SizedBox(height: 16),
            Text(
              '${qm.index + 1}. ${q.text}',
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            ...List.generate(q.options.length, (i) {
              final isCorrect = i == q.correctIndex;
              bool? state; // null normal, true benar, false salah
              if (chosen != null) {
                if (i == chosen && !isCorrect) state = false;
                if (isCorrect) state = true;
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: OptionTile(
                  text: '${String.fromCharCode(97 + i)}. ${q.options[i]}',
                  correct: state,
                  onTap: null,
                ),
              );
            }),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (qm.index > 0) setState(() => qm.index--);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Sebelumnya', style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (qm.index < qm.total - 1) {
                        setState(() => qm.index++);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(qm.index < qm.total - 1 ? 'Berikutnya' : 'Selesai',
                        style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                qm.resetAll();
                Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textDark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text('Coba Lagi', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }
}
