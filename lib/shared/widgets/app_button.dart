import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          disabledBackgroundColor:
              (isPrimary ? AppColors.white : AppColors.bgSecondary).withValues(
                alpha: 0.4,
              ),
          disabledForegroundColor: AppColors.bgPrimary,

          backgroundColor: isPrimary
              ? AppColors.white
              : AppColors.bgSecondary.withValues(alpha: 0.5),
          foregroundColor: isPrimary ? AppColors.bgPrimary : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label, style: AppTextStyles.button),
      ),
    );
  }
}
