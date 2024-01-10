import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:neumorphism_calculator/common/colors.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';
  Color? _iconcolor = Colors.black;
  Color? _textcolor = Colors.white;

  String get result => _result;
  Color? get iconcolor => _iconcolor;
  Color? get textcolor => _textcolor;

  void example() {
    notifyListeners();
  }

  void changeTheme(BuildContext context) {
    NeumorphicTheme.of(context)!.themeMode =
        NeumorphicTheme.isUsingDark(context) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeIconColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme!.isUsingDark) {
      _iconcolor = CommonColor.blackBackgroundColor;
    } else {
      _iconcolor = Colors.white;
    }
    notifyListeners();
  }

  void changeTextColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      _textcolor = CommonColor.blackBackgroundColor;
    } else {
      _textcolor = CommonColor.whiteBackgroundColor;
    }
    notifyListeners();
  }
}
