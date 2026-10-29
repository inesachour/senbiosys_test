import 'package:flutter/material.dart';
import 'package:senbiosys_test/features/tips/widgets/tip_carousel.dart';
import 'package:senbiosys_test/shared/widgets/glass_card.dart';
import 'section_header.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SectionHeader(
              icon: Icons.rocket_launch_outlined,
              title: 'Most powerful tips',
            ),
          ),
          const Expanded(
            child: Center(child: SizedBox(height: 299, child: TipsCarousel())),
          ),
        ],
      ),
    );
  }
}
