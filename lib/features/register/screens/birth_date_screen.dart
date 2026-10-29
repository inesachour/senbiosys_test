import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/providers/register_provider.dart';
import 'package:senbiosys_test/features/register/screens/height_screen.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';
import 'package:senbiosys_test/shared/widgets/app_text_field.dart';

class BirthDateScreen extends StatefulWidget {
  const BirthDateScreen({super.key});

  static Route<void> route(RegisterProvider provider) {
    return MaterialPageRoute(
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: const BirthDateScreen(),
      ),
    );
  }

  @override
  State<BirthDateScreen> createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends State<BirthDateScreen> {
  final _monthFocus = FocusNode();
  final _yearFocus = FocusNode();

  @override
  void dispose() {
    _monthFocus.dispose();
    _yearFocus.dispose();
    super.dispose();
  }

  static List<TextInputFormatter> _digits(int length) => [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(length),
  ];

  void _onDayChanged(String value) {
    context.read<RegisterProvider>().setDay(value);
    if (value.length == 2) _monthFocus.requestFocus();
  }

  void _onMonthChanged(String value) {
    context.read<RegisterProvider>().setMonth(value);
    if (value.length == 2) _yearFocus.requestFocus();
  }

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
                  'What is your date of birth?',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        autofocus: true,
                        borderRadius: 20,
                        label: register.day.isEmpty ? null : 'Day',
                        keyboardType: TextInputType.number,
                        inputFormatters: _digits(2),
                        onChanged: _onDayChanged,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: AppTextField(
                        focusNode: _monthFocus,
                        borderRadius: 20,
                        label: register.month.isEmpty ? null : 'Month',
                        keyboardType: TextInputType.number,
                        inputFormatters: _digits(2),
                        onChanged: _onMonthChanged,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: AppTextField(
                        focusNode: _yearFocus,
                        borderRadius: 20,
                        label: register.year.isEmpty ? null : 'Year',
                        keyboardType: TextInputType.number,
                        inputFormatters: _digits(4),
                        onChanged: register.setYear,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppButton(
                  label: 'Continue',
                  onPressed: register.isBirthDateValid
                      ? () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const HeightScreen(),
                          ),
                        )
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
