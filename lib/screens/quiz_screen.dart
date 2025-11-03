import 'package:flutter/material.dart';
import 'package:quiz_app/service/quiz_manager.dart';
import '../widgets/option_tile.dart';
import '../widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final qm = QuizManager.I;
    final q = qm.current;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // jika belum pilih, tetap boleh lanjut (atau kamu bisa paksa pilih dulu)
          if (!qm.next()) {
            Navigator.pushReplacementNamed(context, '/result');
          } else {
            setState(() {});
          }
        },
        child: const Icon(Icons.skip_next, color: Colors.white),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuizProgressBar(index: qm.index, total: qm.total),
            const SizedBox(height: 50),
            Text(
              '${qm.index + 1}. ${q.text}',
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 50),
            ...List.generate(q.options.length, (i) {
              final sel = qm.chosen[qm.index] == i;
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: OptionTile(
                  text: '${String.fromCharCode(65 + i)}. ${q.options[i]}',
                  selected: sel,
                  onTap: () => setState(() => qm.choose(i)),
                ),
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
