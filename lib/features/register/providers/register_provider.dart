import 'package:flutter/foundation.dart';

class RegisterProvider extends ChangeNotifier {
  static final RegExp _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  String _email = '';

  String get email => _email;
  bool get isEmailValid => _emailPattern.hasMatch(_email.trim());

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
}
