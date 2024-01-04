import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphism_calculator/common/colors.dart';
import 'package:neumorphism_calculator/provider/calculator_provider.dart';
import 'package:neumorphism_calculator/widget/gradint_text.dart';
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
          builder: (BuildContext context, Widget? child) => NeumorphicApp(
                title: 'Neumorphism_Calculator',
                debugShowCheckedModeBanner: false,
                theme: NeumorphicThemeData(
                  baseColor:
                      Color.fromARGB(255, 242, 242, 242).withOpacity(0.9),
                  lightSource: LightSource.topLeft,
                  depth: 10,
                ),
                darkTheme: NeumorphicThemeData(
                  baseColor: CommonColor.blackBackgroundColor,
                  lightSource: LightSource.topLeft,
                  depth: 6,
                ),
                home: const CalculatorLendering(),
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
    var calculatorProvider = Provider.of<CalculatorProvider>(context);
    return Scaffold(
      appBar: null,
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NeumorphicButton(
                      onPressed: () {
                        calculatorProvider.changeTheme(context);
                        calculatorProvider.changeTextColor(context);
                        calculatorProvider.changeIconColor(context);
                      },
                      style: const NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      padding: EdgeInsets.all(12.w),
                      child: Icon(
                        Icons.favorite_border,
                        color: calculatorProvider.iconcolor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
