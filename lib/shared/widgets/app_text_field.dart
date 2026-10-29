import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.onChanged,
    this.label,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.horizontalPadding = 20,
    this.borderRadius = 24,
    this.focusNode,
    this.inputFormatters,
  });

  final ValueChanged<String> onChanged;

  /// Small label shown above the text. Pass null to hide it.
  final String? label;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final double horizontalPadding;
  final double borderRadius;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: suffix == null ? horizontalPadding : 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
                  Text(label!, style: AppTextStyles.fieldLabel),
                TextField(
                  onChanged: onChanged,
                  focusNode: focusNode,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  inputFormatters: inputFormatters,
                  autofocus: autofocus,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.input,
                  decoration: const InputDecoration.collapsed(hintText: null),
                ),
              ],
            ),
          ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
