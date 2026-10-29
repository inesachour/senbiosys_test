import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_theme.dart';
import 'package:senbiosys_test/features/welcome/screens/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const WelcomeScreen(),
    ),
  );
}
