import 'package:flutter/material.dart';

class CommonColor {
  static Color beginCalculatorColor = const Color(0xff8dd8d7);
  static Color endCalculatorColor = const Color(0xff71b0da);
  static Gradient textGradient = LinearGradient(
      colors: [beginCalculatorColor, endCalculatorColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static Color blackBackgroundColor = const Color(0xff393d45);
  static Color whiteBackgroundColor = const Color(0xffF2F2F2);
}
