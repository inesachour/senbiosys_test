import 'package:flutter/foundation.dart';

class LifestyleProvider extends ChangeNotifier {
  final List<String> _habits = const [
    'Tobacco use',
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
