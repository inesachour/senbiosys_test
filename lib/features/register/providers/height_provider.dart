import 'package:flutter/foundation.dart';

enum HeightUnit { feetInches, centimeters }

class HeightProvider extends ChangeNotifier {
  static const int minFeet = 2;
  static const int maxFeet = 8;
  static const int minCm = 100;
  static const int maxCm = 250;

  static final List<int> feetValues = List.generate(
    maxFeet - minFeet + 1,
    (i) => minFeet + i,
  );
  static final List<int> inchValues = List.generate(12, (i) => i);
  static final List<int> cmValues = List.generate(
    maxCm - minCm + 1,
    (i) => minCm + i,
  );

  HeightUnit _unit = HeightUnit.feetInches;
  int _feet = 5;
  int _inches = 7;
  int _cm = 170;

  HeightUnit get unit => _unit;
  int get feet => _feet;
  int get inches => _inches;
  int get cm => _cm;

  void setUnit(HeightUnit unit) {
    if (unit == _unit) return;
    if (unit == HeightUnit.centimeters) {
      _cm = ((_feet * 12 + _inches) * 2.54).round().clamp(minCm, maxCm);
    } else {
      final totalInches = (_cm / 2.54).round();
      _feet = (totalInches ~/ 12).clamp(minFeet, maxFeet);
      _inches = totalInches % 12;
    }
    _unit = unit;
    notifyListeners();
  }

  void setFeet(int value) {
    _feet = value;
    notifyListeners();
  }

  void setInches(int value) {
    _inches = value;
    notifyListeners();
  }

  void setCm(int value) {
    _cm = value;
    notifyListeners();
  }
}
