import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/tips/models/tip.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key, required this.tip});

  static const double _imageZoom = 1.5;

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: _imageZoom,
            alignment: Alignment.topCenter,
            child: Image.asset(
              tip.imagePath,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const ColoredBox(color: Color(0x33000000)),
          Padding(
            padding: const EdgeInsets.all(20),
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
