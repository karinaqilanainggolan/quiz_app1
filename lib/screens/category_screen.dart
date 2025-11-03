import 'package:flutter/material.dart';
import 'package:quiz_app/service/quiz_manager.dart';
import '../data/questions.dart';
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
      floatingActionButton: selected == null
          ? null // Sembunyikan tombol jika tidak ada kategori yang dipilih
          : FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          QuizManager.I.startCategory(selected!);
          Navigator.pushNamed(context, '/quiz');
        },
        label: const Text('LANJUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              'Pilih Kategori',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Tantang dirimu dengan kategori favoritmu!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 100),
            // Menggunakan GridView untuk tampilan yang lebih menarik
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  mainAxisSpacing: 20, // Jarak vertikal antar item
                  crossAxisSpacing: 20, // Jarak horizontal antar item
                  childAspectRatio: 2.5, // Mengatur rasio lebar-tinggi tombol
                ),
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
