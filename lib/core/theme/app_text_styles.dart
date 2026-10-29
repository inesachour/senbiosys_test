import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.cormorant,
    fontSize: 52,
    fontWeight: FontWeight.w300,
    height: 1.0,
    letterSpacing: -1,
    color: AppColors.white,
  );

  static final TextStyle headlineItalic = headline.copyWith(
    fontStyle: FontStyle.italic,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.4,
    color: AppColors.secondaryText,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static const TextStyle tipTitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.4,
    color: AppColors.white,
  );

  static const TextStyle tipDescription = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.25,
    color: AppColors.white,
  );

  static const TextStyle chip = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    height: 1.14,
    letterSpacing: -0.5,
    color: AppColors.white,
  );

  static const TextStyle optionTitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle optionSubtitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryText,
  );
}
