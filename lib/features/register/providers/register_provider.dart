import 'package:flutter/foundation.dart';
import 'package:senbiosys_test/features/register/models/password_strengh.dart';
import '../models/password_requirement.dart';

class RegisterProvider extends ChangeNotifier {
  static final RegExp _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static const int _minPasswordLength = 8;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool get isEmailValid => _emailPattern.hasMatch(_email.trim());

  String _day = '';
  String _month = '';
  String _year = '';

  String get day => _day;
  String get month => _month;
  String get year => _year;

  bool get isBirthDateValid {
    final day = int.tryParse(_day);
    final month = int.tryParse(_month);
    final year = int.tryParse(_year);
    if (day == null || month == null || year == null || _year.length != 4) {
      return false;
    }
    final date = DateTime(year, month, day);
    final isRealDate =
        date.year == year && date.month == month && date.day == day;
    return isRealDate && year >= 1900 && !date.isAfter(DateTime.now());
  }

  void setDay(String value) {
    _day = value;
    notifyListeners();
  }

  void setMonth(String value) {
    _month = value;
    notifyListeners();
  }

  void setYear(String value) {
    _year = value;
    notifyListeners();
  }

  List<PasswordRequirement> get requirements => [
    PasswordRequirement(
      '1 lowercase letter',
      RegExp('[a-z]').hasMatch(_password),
    ),
    PasswordRequirement('1 number', RegExp(r'\d').hasMatch(_password)),
    PasswordRequirement(
      '1 uppercase letter',
      RegExp('[A-Z]').hasMatch(_password),
    ),
    PasswordRequirement(
      '1 special character',
      RegExp('[^A-Za-z0-9]').hasMatch(_password),
    ),
    PasswordRequirement(
      '$_minPasswordLength characters',
      _password.length >= _minPasswordLength,
    ),
  ];

  PasswordStrength get strength {
    final met = requirements.where((r) => r.isMet).length;
    if (met <= 2) return PasswordStrength.weak;
    if (met == 3) return PasswordStrength.fair;
    if (met == 4) return PasswordStrength.good;
    return PasswordStrength.great;
  }

  bool get canSubmitPassword =>
      requirements.every((r) => r.isMet) && _password == _confirmPassword;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }
}
