import 'package:flutter/foundation.dart';
import '../models/tobacco_option.dart';

class TobaccoProvider extends ChangeNotifier {
  static const List<TobaccoOption> _options = [
    TobaccoOption(title: 'Never'),
    TobaccoOption(title: 'Former smoker'),
    TobaccoOption(
      title: 'Occasional',
      description: 'Less than 1 cigarette per day',
    ),
    TobaccoOption(
      title: 'Regular smoker',
      description: 'Up to 10 cigarettes per day',
    ),
    TobaccoOption(
      title: 'Heavy smoker',
      description: 'More than 10 cigarettes per day',
    ),
  ];

  int _selectedIndex = 0;

  List<TobaccoOption> get options => _options;
  int get selectedIndex => _selectedIndex;
  TobaccoOption get selected => _options[_selectedIndex];

  void select(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
