import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/providers/register_provider.dart';
import 'package:senbiosys_test/features/register/screens/birth_date_screen.dart';
import 'package:senbiosys_test/features/register/widgets/password_checklist.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';
import 'package:senbiosys_test/shared/widgets/app_text_field.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static Route<void> route(RegisterProvider provider) {
    return MaterialPageRoute(
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final register = context.watch<RegisterProvider>();
    final hasPassword = register.password.isNotEmpty;

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
                  'Set up a password',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Must be at least 8 characters',
                  style: AppTextStyles.fieldCaption,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextField(
                          autofocus: true,
                          label: hasPassword ? 'Password' : null,
                          obscureText: !register.isPasswordVisible,
                          textInputAction: TextInputAction.next,
                          onChanged: register.setPassword,
                          suffix: _VisibilityToggle(
                            visible: register.isPasswordVisible,
                            onPressed: register.togglePasswordVisibility,
                          ),
                        ),
                        if (hasPassword) ...[
                          const SizedBox(height: 8),
                          const PasswordChecklist(),
                          const SizedBox(height: 20),
                        ] else
                          const SizedBox(height: 12),
                        AppTextField(
                          label: register.confirmPassword.isEmpty
                              ? null
                              : 'Confirm password',
                          obscureText: !register.isConfirmPasswordVisible,
                          textInputAction: TextInputAction.done,
                          onChanged: register.setConfirmPassword,
                          suffix: _VisibilityToggle(
                            visible: register.isConfirmPasswordVisible,
                            onPressed: register.toggleConfirmPasswordVisibility,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppButton(
                  label: 'Continue',
                  onPressed: register.canSubmitPassword
                      ? () => Navigator.of(
                          context,
                        ).push(BirthDateScreen.route(register))
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

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({required this.visible, required this.onPressed});

  final bool visible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColors.secondaryText,
      ),
    );
  }
}
