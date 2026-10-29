import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bgPrimary = Color(0xFF0A1325);
  static const Color bgSecondary = Color(0xFF233250);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFF6E7685);

  static const Color link = Color(0xFF4D7CC0);
  static const Color fieldFill = Color(0x14FFFFFF);

  static const Color success = Color(0xFF5FAE8E);
  static const Color requirementText = Color(0xCCFFFFFF);

  static const LinearGradient screenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bgSecondary, bgPrimary],
    stops: [0.0, 0.55],
  );

  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x000A1325), Color(0xE50A1325), Color(0xFF0A1325)],
    stops: [0.0, 0.9865, 1.0],
  );
}
