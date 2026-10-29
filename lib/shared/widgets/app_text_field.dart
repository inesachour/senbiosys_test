import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
  });

  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      cursorColor: AppColors.white,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.fieldFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 22,
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }
}
