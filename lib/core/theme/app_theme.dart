import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
    fontFamily: AppFonts.suisse,
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.bgPrimary,
      secondary: AppColors.bgSecondary,
    ),
  );
}
