import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/features/tips/screens/tobacco_screen.dart';
import 'package:senbiosys_test/shared/widgets/app_chip.dart';
import 'package:senbiosys_test/shared/widgets/glass_card.dart';
import '../providers/lifestyle_provider.dart';
import 'section_header.dart';

class LifestyleCard extends StatelessWidget {
  const LifestyleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final lifestyle = context.watch<LifestyleProvider>();

    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SectionHeader(
                icon: Icons.person_outline,
                title: 'Your lifestyle',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final habit in lifestyle.habits)
                    AppChip(
                      label: habit,
                      icon: Icons.add,
                      onTap: habit == LifestyleProvider.tobaccoUse
                          ? () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const TobaccoScreen(),
                              ),
                            )
                          : null,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  for (final metric in lifestyle.metrics)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: AppChip(
                        label: metric,
                        icon: Icons.play_arrow_rounded,
                        filled: true,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
