import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphism_calculator/provider/calculator_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorProvider>(
          create: (_) => CalculatorProvider(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (BuildContext context, Widget? child) => const MaterialApp(
                title: 'Neumorphism_Calculator',
                supportedLocales: [Locale('ko', 'KR')],
                locale: Locale('ko'),
                debugShowCheckedModeBanner: false,
                home: CalculatorLendering(),
              )),
    );
  }
}

class CalculatorLendering extends StatefulWidget {
  const CalculatorLendering({super.key});

  @override
  State<CalculatorLendering> createState() => _CalculaotrState();
}

class _CalculaotrState extends State<CalculatorLendering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [Text("hello")],
          ),
        ),
      ),
    );
  }
}
