import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/models/password_requirement.dart';
import 'package:senbiosys_test/features/register/models/password_strengh.dart';
import 'package:senbiosys_test/features/register/providers/register_provider.dart';

class PasswordChecklist extends StatelessWidget {
  const PasswordChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    final register = context.watch<RegisterProvider>();
    final strength = register.strength;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final requirement in register.requirements)
                _RequirementRow(requirement: requirement),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Password strength',
              style: AppTextStyles.strengthCaption,
            ),
            Text(
              strength.label,
              style: AppTextStyles.strengthCaption.copyWith(
                color: strength == PasswordStrength.great
                    ? AppColors.success
                    : AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.requirement});

  final PasswordRequirement requirement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 12,
            color: requirement.isMet
                ? AppColors.white
                : AppColors.secondaryText,
          ),
          const SizedBox(width: 6),
          Text(requirement.label, style: AppTextStyles.requirement),
        ],
      ),
    );
  }
}
