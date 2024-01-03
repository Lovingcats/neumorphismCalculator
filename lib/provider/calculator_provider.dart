import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';

  String get result => _result;

  void example() {
    notifyListeners();
  }
}
