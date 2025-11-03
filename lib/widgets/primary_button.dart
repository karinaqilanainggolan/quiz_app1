import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles.dart';


class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = filled ? AppColors.accent : AppColors.white;
    final fg = filled ? AppColors.white : AppColors.textDark;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: filled ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
