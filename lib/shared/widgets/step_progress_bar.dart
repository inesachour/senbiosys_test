import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(height: 1, color: AppColors.progressTrack),
          FractionallySizedBox(
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              height: 1.5,
              decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [BoxShadow(color: Color(0x80FFFFFF), blurRadius: 6)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
