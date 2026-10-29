import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senbiosys_test/core/theme/app_colors.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';
import 'package:senbiosys_test/features/register/providers/height_provider.dart';
import 'package:senbiosys_test/shared/widgets/app_button.dart';
import 'package:senbiosys_test/shared/widgets/picker_wheel.dart';
import 'package:senbiosys_test/shared/widgets/segmented_toggle.dart';
import 'package:senbiosys_test/shared/widgets/step_progress_bar.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HeightProvider(),
      child: const _HeightView(),
    );
  }
}

class _HeightView extends StatelessWidget {
  const _HeightView();

  static const double _progress = 0.6;
  static const double _wheelHeight = 300;
  static const double _columnWidth = 117;

  List<String> _labels(List<int> values) => values.map((v) => '$v').toList();

  Widget _buildWheels(HeightProvider height) {
    if (height.unit == HeightUnit.centimeters) {
      return PickerWheel(
        key: const ValueKey('cm'),
        labels: _labels(HeightProvider.cmValues),
        selectedIndex: height.cm - HeightProvider.minCm,
        unit: 'cm',
        onSelectedItemChanged: (i) => height.setCm(HeightProvider.minCm + i),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _columnWidth,
            child: PickerWheel(
              key: const ValueKey('ft'),
              labels: _labels(HeightProvider.feetValues),
              selectedIndex: height.feet - HeightProvider.minFeet,
              unit: 'ft',
              onSelectedItemChanged: (i) =>
                  height.setFeet(HeightProvider.minFeet + i),
            ),
          ),
          SizedBox(
            width: _columnWidth,
            child: PickerWheel(
              key: const ValueKey('in'),
              labels: _labels(HeightProvider.inchValues),
              selectedIndex: height.inches,
              unit: 'in',
              onSelectedItemChanged: height.setInches,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = context.watch<HeightProvider>();

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
                  child: Stack(
                    children: [
                      Align(
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
                      const Center(
                        child: SizedBox(
                          width: 220,
                          child: StepProgressBar(progress: _progress),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'What is your height?',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'This helps us provide accurate, meaningful insights',
                  style: AppTextStyles.fieldCaption,
                ),
                const SizedBox(height: 24),
                SegmentedToggle(
                  labels: const ['Ft/in', 'Cm'],
                  selectedIndex: height.unit == HeightUnit.feetInches ? 0 : 1,
                  onChanged: (i) => height.setUnit(
                    i == 0 ? HeightUnit.feetInches : HeightUnit.centimeters,
                  ),
                ),
                const SizedBox(height: 58),
                SizedBox(
                  height: _wheelHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 63,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.pickerHighlight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (rect) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.3, 0.7, 1.0],
                        ).createShader(rect),
                        child: _buildWheels(height),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppButton(
                  label: 'Continue',
                  onPressed: () {
                    // TODO: navigate to the next screen
                  },
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
