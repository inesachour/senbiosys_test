import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/screens/register_email_screen.dart';
import 'package:senbiosys_test/features/welcome/widgets/welcome_header.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/welcome_background.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(gradient: AppColors.bgGradient),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const WelcomeHeader(),
                  const Spacer(),
                  const Text(
                    'Gentle insights from a quiet\ncompanion that listens',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    label: 'Log in',
                    onPressed: () {
                      // TODO: navigate to Log in
                    },
                  ),
                  const SizedBox(height: 14),
                  AppButton(
                    label: 'Create account',
                    isPrimary: false,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterEmailScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
