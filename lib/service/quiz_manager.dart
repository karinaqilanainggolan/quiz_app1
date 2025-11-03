import 'package:quiz_app/models/question.dart';

import '../data/questions.dart';

class QuizManager {
  static final QuizManager I = QuizManager._();

  QuizManager._();

  String playerName = '';
  String? selectedCategory;
  List<Question> _current = [];
  int index = 0;
  final List<int?> chosen = []; // null = belum pilih, 0..3 = jawaban

  // --- Setup ---
  void startCategory(String category) {
    selectedCategory = category;
    _current = questions.where((q) => q?.category == category).toList();
    index = 0;
    chosen
      ..clear()
      ..addAll(List<int?>.filled(_current.length, null));
  }

  List<Question> get currentList => _current;
  Question get current => _current[index];

  // --- Actions ---
  void choose(int optionIndex) {
    chosen[index] = optionIndex;
  }

  bool next() {
    if (index < _current.length - 1) {
      index++;
      return true;
    }
    return false; // habis
  }

  int get total => _current.length;

  int get score {
    int s = 0;
    for (var i = 0; i < _current.length; i++) {
      final c = chosen[i];
      if (c != null && c == _current[i].correctIndex) s++;
    }
    return s;
  }

  void resetAll() {
    playerName = '';
    selectedCategory = null;
    _current = [];
    index = 0;
    chosen.clear();
  }
}

extension on Object? {
  get category => null;
}
