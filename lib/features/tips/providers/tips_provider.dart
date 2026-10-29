import 'package:flutter/foundation.dart';
import '../models/tip.dart';

class TipsProvider extends ChangeNotifier {
  static const List<Tip> _tips = [
    Tip(
      title: 'Calm your pulse',
      description: 'Sleep is when your cardiovascular system repairs itself.',
      imagePath: 'assets/images/tips/tip_1.png',
    ),
    Tip(
      title: 'Train your arteries',
      description:
          'Move your body to keep your blood vessels flexible and your heart efficient.',
      imagePath: 'assets/images/tips/tip_2.png',
    ),
    Tip(
      title: 'Feed your heart',
      description:
          'What you eat shapes your blood vessels, cholesterol, and inflammation levels.',
      imagePath: 'assets/images/tips/tip_3.png',
    ),
  ];

  int _currentIndex = 1;

  List<Tip> get tips => _tips;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}
