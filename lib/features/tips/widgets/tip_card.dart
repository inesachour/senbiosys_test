import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/tips/models/tip.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key, required this.tip});

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(tip.imagePath, fit: BoxFit.cover),
          const ColoredBox(color: Color(0x33000000)),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tip.title, style: AppTextStyles.tipTitle),
                const Spacer(),
                Text(tip.description, style: AppTextStyles.tipDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
