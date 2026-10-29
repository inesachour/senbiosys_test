import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bgPrimary = Color(0xFF0A1325);
  static const Color bgSecondary = Color(0xFF233250);

  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x000A1325), Color(0xE50A1325), Color(0xFF0A1325)],
    stops: [0.0, 0.9865, 1.0],
  );
}
