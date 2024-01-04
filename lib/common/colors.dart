import 'package:flutter/material.dart';

class CommonColor {
  static Color beginCalculatorColor = const Color.fromARGB(255, 50, 216, 245);
  static Color endCalculatorColor = const Color.fromARGB(255, 21, 190, 196);
  static Gradient textGradient = LinearGradient(
      colors: [beginCalculatorColor, endCalculatorColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static Color blackBackgroundColor = const Color(0xff393d45);
  static Color whiteBackgroundColor = Colors.white;
}
