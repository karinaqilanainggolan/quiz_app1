import 'package:flutter/material.dart';
import 'package:quiz_app/%20core/styles.dart';
import 'package:quiz_app/core/styles.dart';


class QuizProgressBar extends StatelessWidget {
  final int index;
  final int total;

  const QuizProgressBar({super.key, required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    final ratio = total == 0 ? 0.0 : (index + 1) / total;
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: ratio.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
