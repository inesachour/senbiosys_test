import 'package:flutter/material.dart';
import 'package:senbiosys_test/core/theme/app_text_styles.dart';

class PickerWheel extends StatefulWidget {
  const PickerWheel({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.unit,
    required this.onSelectedItemChanged,
  });

  final List<String> labels;
  final int selectedIndex;
  final String unit;
  final ValueChanged<int> onSelectedItemChanged;

  @override
  State<PickerWheel> createState() => _PickerWheelState();
}

class _PickerWheelState extends State<PickerWheel> {
  late final FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(
      initialItem: widget.selectedIndex,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildItem(int index) {
    final selected = index == widget.selectedIndex;
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Text(
          widget.labels[index],
          style: selected
              ? AppTextStyles.pickerSelected
              : AppTextStyles.pickerItem,
        ),
        if (selected)
          Transform.translate(
            offset: const Offset(30, 6),
            child: Text(widget.unit, style: AppTextStyles.pickerUnit),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: _controller,
      itemExtent: 63,
      diameterRatio: 1.9,
      perspective: 0.003,
      overAndUnderCenterOpacity: 0.55,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: widget.onSelectedItemChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: widget.labels.length,
        builder: (context, index) => _buildItem(index),
      ),
    );
  }
}
