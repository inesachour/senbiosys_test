import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/providers/register_provider.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';
import 'package:senbiosys_test/shared/widgets/app_text_field.dart';

class RegisterEmailScreen extends StatelessWidget {
  const RegisterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: const _RegisterEmailView(),
    );
  }
}

class _RegisterEmailView extends StatelessWidget {
  const _RegisterEmailView();

  @override
  Widget build(BuildContext context) {
    final register = context.watch<RegisterProvider>();

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.screenGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kToolbarHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Let’s get started',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'We will send you an email to confirm it',
                  style: AppTextStyles.fieldCaption,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onChanged: register.setEmail,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // TODO: navigate to Log in
                  },
                  child: const Text(
                    'Already have an account? Log in',
                    style: AppTextStyles.link,
                  ),
                ),
                const Spacer(),
                AppButton(
                  label: 'Continue',
                  onPressed: register.isEmailValid
                      ? () {
                          // TODO: navigate to the next register screen
                        }
                      : null,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
