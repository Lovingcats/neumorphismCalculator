import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphism_calculator/common/colors.dart';
import 'package:neumorphism_calculator/provider/calculator_provider.dart';
import 'package:neumorphism_calculator/widget/gradint_text.dart';
import 'package:provider/provider.dart';
import 'package:neumorphism_calculator/widget/calculator_widget.dart';
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
                  baseColor: CommonColor.whiteBackgroundColor,
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
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: cAppbar(context, calculatorProvider),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(
                top: 105.h, right: 15.w
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GradientText("2,020 x 2 - 1,942", gradient: CommonColor.textGradient, style: TextStyle(
                    fontSize: 13.sp
                  ),)
              ],),)
              // NeumorphicButton(
              //   onPressed: () {

              //   },
              //   style: const NeumorphicStyle(
              //     shape: NeumorphicShape.concave,
              //     boxShape: NeumorphicBoxShape.circle(),
              //   ),
              //   padding: EdgeInsets.all(12.w),
              //   child: GradientText("C", gradient: CommonColor.textGradient)
              // ),
            ],
          ),
        ),
      ),
    );
  }

}
