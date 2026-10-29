import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  static const _shape = StadiumBorder(
    side: BorderSide(color: AppColors.glassBorder),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 52,
        decoration: const ShapeDecoration(
          shape: _shape,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x08FFFFFF), Color(0x00FFFFFF)],
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: _shape,
          child: const Center(
            child: Text('Learn more', style: AppTextStyles.button),
          ),
        ),
      ),
    );
  }
}
