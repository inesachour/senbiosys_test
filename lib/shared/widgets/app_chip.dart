import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    required this.icon,
    this.filled = false,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? AppColors.chipFill : Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: StadiumBorder(
        side: filled
            ? BorderSide.none
            : const BorderSide(color: AppColors.glassBorder),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 39,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: AppTextStyles.chip),
                const SizedBox(width: 8),
                Icon(icon, size: 14, color: AppColors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
