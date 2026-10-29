import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/tips/providers/tobacco_provider.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';
import 'package:senbiosys_test/shared/widgets/option_tile.dart';

class TobaccoScreen extends StatelessWidget {
  const TobaccoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TobaccoProvider(),
      child: const _TobaccoView(),
    );
  }
}

class _TobaccoView extends StatelessWidget {
  const _TobaccoView();

  @override
  Widget build(BuildContext context) {
    final tobacco = context.watch<TobaccoProvider>();

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.screenGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.close, color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you currently smoke or use tobacco products?',
                    style: AppTextStyles.screenTitle,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: tobacco.options.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final option = tobacco.options[index];
                      return OptionTile(
                        title: option.title,
                        subtitle: option.description,
                        selected: index == tobacco.selectedIndex,
                        onTap: () => tobacco.select(index),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 11),
                AppButton(
                  label: 'Continue',
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
