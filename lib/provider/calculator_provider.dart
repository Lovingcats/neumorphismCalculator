import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:neumorphism_calculator/common/colors.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';
  String _formulaText = '';
  Color _iconcolor = Colors.black;
  Color _textcolor = Colors.black;
  List<String> numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> signs = ["+", "-", "÷", "×"];

  String get result => _result;
  String get formulaText => _formulaText;
  Color get iconcolor => _iconcolor;  
  Color get textcolor => _textcolor;

  // 숫자나 기호 입력 처리
  void addFormula(String text) {
    if (numbers.contains(text)) {
      _formulaText += text;
    } else if (signs.contains(text)) {
      // 연속된 기호 방지
      if (_formulaText.isNotEmpty &&
          !signs.contains(_formulaText[_formulaText.length - 1])) {
        _formulaText += text.replaceAll("÷", "/");
      }
    } else if (text == ".") {
      // 소수점 중복 방지
      if (_formulaText.isNotEmpty &&
          !_formulaText.endsWith(".") &&
          !RegExp(r'\d+\.\d*$').hasMatch(_formulaText)) {
        _formulaText += text;
      }
    } else if (text == "=") {
      // = 입력 시 결과 계산
      calculateResult();
    } else if (text == "C") {
      // C 입력 시 초기화
      clearAll();
    }
    notifyListeners();
  }



  void calculateResult() {
    if (_formulaText.isEmpty) {
      _result = "0";
      notifyListeners();
      return;
    }

    String formula = _formulaText
        .replaceAll("×", "*")
        .replaceAll("÷", "/") // ÷ 기호를 /로 변환
        .replaceAll("%", "/100");

    final parsedResult = _evaluateFormula(formula);
    _result = parsedResult.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    
    notifyListeners();
  }


  double _evaluateFormula(String formula) {
    // 수식을 계산하는 로직
    List<String> tokens = _tokenizeFormula(formula);
    List<double> numbers = [];
    List<String> operators = [];

    for (var token in tokens) {
      if (_isNumber(token)) {
        numbers.add(double.parse(token));
      } else {
        while (operators.isNotEmpty &&
            _precedence(operators.last) >= _precedence(token)) {
          double b = numbers.removeLast();
          double a = numbers.removeLast();
          String op = operators.removeLast();
          numbers.add(_applyOperator(a, b, op));
        }
        operators.add(token);
      }
    }

    while (operators.isNotEmpty) {
      double b = numbers.removeLast();
      double a = numbers.removeLast();
      String op = operators.removeLast();
      numbers.add(_applyOperator(a, b, op));
    }

    return numbers.last;
  }

  List<String> _tokenizeFormula(String formula) {
    // 수식을 숫자와 기호로 분리
    final regex = RegExp(r'(\d+\.?\d*|\+|\-|\*|\/)');
    return regex.allMatches(formula).map((match) => match.group(0)!).toList();
  }

  bool _isNumber(String token) {
    return double.tryParse(token) != null;
  }

  int _precedence(String operator) {
    if (operator == "+" || operator == "-") return 1;
    if (operator == "*" || operator == "/") return 2;
    return 0;
  }

  double _applyOperator(double a, double b, String operator) {
    switch (operator) {
      case "+":
        return a + b;
      case "-":
        return a - b;
      case "*":
        return a * b;
      case "/":
        if (b == 0) throw Exception("Division by zero");
        return a / b;
      default:
        throw Exception("Invalid operator");
    }
  }

  void clearAll() {
    _formulaText = '';
    _result = '';
    notifyListeners();
  }

  void deleteLast() {
    if (_formulaText.isNotEmpty) {
      _formulaText = _formulaText.substring(0, _formulaText.length - 1);
    }
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
