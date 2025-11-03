class Question {
  final String id;
  final String category; // "Matematika", "Seni", "IPA", "Bahasa"
  final String text;
  final List<String> options; // 4 opsi
  final int correctIndex;     // 0..3

  const Question({
    required this.id,
    required this.category,
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}
