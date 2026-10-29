import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/velia.png', width: 24, height: 24),
            const SizedBox(width: 8),
            const Text('Welcome to Velia', style: AppTextStyles.caption),
          ],
        ),
        const SizedBox(height: 20),
        Text.rich(
          TextSpan(
            style: AppTextStyles.headline,
            children: [
              const TextSpan(text: 'Stay '),
              TextSpan(text: 'connected', style: AppTextStyles.headlineItalic),
              const TextSpan(text: '\nto everyday\nbalance'),
            ],
          ),
        ),
      ],
    );
  }
}
