import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../services/quiz_manager.dart';
import '../widgets/primary_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: selected == null
            ? null
            : () {
          QuizManager.I.startCategory(selected!);
          Navigator.pushNamed(context, '/quiz');
        },
        child: const Icon(Icons.skip_next, color: Colors.white),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text('Kategori', style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, i) {
                  final cat = categories[i];
                  final active = selected == cat;
                  return PrimaryButton(
                    label: cat,
                    filled: active,
                    onPressed: () => setState(() => selected = cat),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
