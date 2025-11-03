import 'package:flutter/material.dart';

class AppColors {
  static final Color primary = Color(0xFF2B3E8A); // biru gelap
  static const Color accent = Color(0xFF9B8CF4);  // ungu progress
  static const Color correct = Color(0xFF58E36E); // hijau benar
  static const Color wrong   = Color(0xFFE74C3C); // merah salah
  static const Color white   = Colors.white;
  static const Color textDark = Colors.black;
}

final appTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.primary,
  fontFamily: 'Audiowide',
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
        color: AppColors.white, fontWeight: FontWeight.w700, letterSpacing: .2),
    titleLarge: TextStyle(
        color: AppColors.white, fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: AppColors.white),
  ),
);