import 'package:flutter/material.dart';

class NextFab extends StatelessWidget {
  final VoidCallback onNext;
  const NextFab({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onNext,
      child: const Icon(Icons.play_arrow_rounded, size: 34),
    );
  }
}
