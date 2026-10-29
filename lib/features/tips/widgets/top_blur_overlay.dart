import 'dart:ui';
import 'package:flutter/material.dart';

class TopBlurOverlay extends StatelessWidget {
  const TopBlurOverlay({super.key});

  static const double _fadeHeight = 80;
  static const Color _tint = Color(0x4DFFFFFF);

  @override
  Widget build(BuildContext context) {
    final bandHeight = MediaQuery.paddingOf(context).top + kToolbarHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(height: bandHeight, color: _tint),
          ),
        ),
        Container(
          height: _fadeHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_tint, Color(0x00FFFFFF)],
            ),
          ),
        ),
      ],
    );
  }
}
