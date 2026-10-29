import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/features/tips/providers/lifestyle_provider.dart';
import 'package:senbiosys_test/features/tips/providers/tips_provider.dart';
import 'package:senbiosys_test/features/tips/widgets/learn_more_button.dart';
import 'package:senbiosys_test/features/tips/widgets/lifestyle_card.dart';
import 'package:senbiosys_test/features/tips/widgets/tips_card.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TipsProvider()),
        ChangeNotifierProvider(create: (_) => LifestyleProvider()),
      ],
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/tips_background.png', fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(gradient: AppColors.bgGradient),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const Expanded(child: TipsCard()),
                    const SizedBox(height: 8),
                    const LifestyleCard(),
                    const SizedBox(height: 8),
                    LearnMoreButton(
                      onPressed: () {
                        // TODO: navigate to second screen
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
