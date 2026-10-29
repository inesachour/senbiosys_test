import 'package:flutter/foundation.dart';

class LifestyleProvider extends ChangeNotifier {
  static const String tobaccoUse = 'Tobacco use';

  final List<String> _habits = const [
    tobaccoUse,
    'Alcohol use',
    'Physical activity',
    'Stress levels',
  ];

  final List<String> _metrics = const [
    '60 kg',
    '165 cm',
    'Female',
    '17.08.1992',
  ];

  List<String> get habits => _habits;
  List<String> get metrics => _metrics;
}
