import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:neumorphism_calculator/common/colors.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';
  String _formulaText = '';
  Color _iconcolor = Colors.black;
  Color _textcolor = Colors.black;
  List<String> numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> signs = ["+", "-", "%", "×"];

  String get result => _result;
  String get formulaText => _formulaText;
  Color get iconcolor => _iconcolor;  
  Color get textcolor => _textcolor;

  //숫자 입력시 문자열에 더해가는 형식
  void addFormula(String text){
     if (numbers.contains(text)) {
      _formulaText += text;
     }
     if (signs.contains(text) && !signs.contains(_formulaText[_formulaText.length])) {
      _formulaText += text;
     }
    notifyListeners();
  }

  void addResult() {
    notifyListeners();
  }

  void changeTheme(BuildContext context) {
    print(_formulaText);
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
