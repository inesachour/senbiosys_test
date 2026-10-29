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
    fontFamily: AppFonts.suisse, // TODO inter
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    height: 1.14,
    letterSpacing: -0.5,
    color: AppColors.white,
  );

  static const TextStyle fieldCaption = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryText,
  );

  static const TextStyle link = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.link,
  );

  static const TextStyle input = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static const TextStyle fieldLabel = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryText,
  );

  static const TextStyle requirement = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.33,
    color: AppColors.requirementText,
  );

  static const TextStyle strengthCaption = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.33,
    color: AppColors.secondaryText,
  );

  static const TextStyle pickerSelected = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static const TextStyle pickerItem = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: AppColors.requirementText,
  );

  static const TextStyle pickerUnit = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryText,
  );

  static const TextStyle segmentSelected = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.bgPrimary,
  );

  static const TextStyle segmentIdle = TextStyle(
    fontFamily: AppFonts.suisse,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.secondaryText,
  );
}
