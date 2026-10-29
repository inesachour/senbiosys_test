import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/features/tips/providers/tips_provider.dart';
import 'tip_card.dart';

class TipsCarousel extends StatefulWidget {
  const TipsCarousel({super.key});

  @override
  State<TipsCarousel> createState() => _TipsCarouselState();
}

class _TipsCarouselState extends State<TipsCarousel> {
  static const double _minScale = 0.866;

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.63,
      initialPage: context.read<TipsProvider>().currentIndex,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _scaleFor(int index) {
    final page = _controller.hasClients && _controller.position.haveDimensions
        ? _controller.page!
        : _controller.initialPage.toDouble();
    return (1 - (page - index).abs() * (1 - _minScale)).clamp(_minScale, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final tips = context.read<TipsProvider>().tips;

    return PageView.builder(
      controller: _controller,
      itemCount: tips.length,
      onPageChanged: context.read<TipsProvider>().setCurrentIndex,
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) =>
            Transform.scale(scale: _scaleFor(index), child: child),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.5),
          child: TipCard(tip: tips[index]),
        ),
      ),
    );
  }
}
