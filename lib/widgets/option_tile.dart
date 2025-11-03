import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final bool? correct; // null = normal, true/false = review
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.text,
    this.selected = false,
    this.correct,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.white;
    Color fg = AppColors.textDark;

    if (correct != null) {
      bg = correct! ? AppColors.correct : AppColors.wrong;
      fg = AppColors.white;
    } else if (selected) {
      bg = const Color(0xFF5E73E6); // biru muda pilih
      fg = AppColors.white;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fg,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
