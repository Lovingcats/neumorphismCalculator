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
              cCalculateText(calculatorProvider),
              Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 25.h, bottom: 40.h, left: 12.w, right: 12.w),
                    width: double.infinity.w,
                    child: Column(
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: NeumorphicButton(
                                      margin: EdgeInsets.all(10.w),
                                      onPressed: () {},
                                      style: const NeumorphicStyle(
                                        shape: NeumorphicShape.convex,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        depth: 2,
                                        intensity: 0.55,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GradientText(
                                            "C",
                                            gradient: CommonColor.textGradient,
                                            style: TextStyle(fontSize: 20.sp),
                                          ),
                                        ],
                                      )),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: NeumorphicButton(
                                      margin: EdgeInsets.all(10.w),
                                      onPressed: () {},
                                      style: const NeumorphicStyle(
                                        shape: NeumorphicShape.concave,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        depth: 2,
                                        intensity: 0.55,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GradientText(
                                            "+/-",
                                            gradient: CommonColor.textGradient,
                                            style: TextStyle(fontSize: 20.sp),
                                          ),
                                        ],
                                      )),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: NeumorphicButton(
                                      margin: EdgeInsets.all(10.w),
                                      onPressed: () {},
                                      style: const NeumorphicStyle(
                                        shape: NeumorphicShape.concave,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        depth: 2,
                                        intensity: 0.55,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GradientText(
                                            "%",
                                            gradient: CommonColor.textGradient,
                                            style: TextStyle(fontSize: 20.sp),
                                          ),
                                        ],
                                      )),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: NeumorphicButton(
                                      margin: EdgeInsets.all(10.w),
                                      onPressed: () {},
                                      style: const NeumorphicStyle(
                                        shape: NeumorphicShape.concave,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        depth: 2,
                                        intensity: 0.55,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GradientText(
                                            "÷",
                                            gradient: CommonColor.textGradient,
                                            style: TextStyle(fontSize: 22.sp),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "7",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "8",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "9",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GradientText(
                                          "×",
                                          gradient: CommonColor.textGradient,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    )),
                              )
                            ])),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "4",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "5",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "6",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GradientText(
                                          "-",
                                          gradient: CommonColor.textGradient,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    )),
                              )
                            ])),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "3",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GradientText(
                                          "+",
                                          gradient: CommonColor.textGradient,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ],
                                    )),
                              )
                            ])),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: NeumorphicButton(
                                    margin: EdgeInsets.all(10.w),
                                    onPressed: () {},
                                    style: const NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      boxShape: NeumorphicBoxShape.circle(),
                                      depth: 2,
                                      intensity: 0.55,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          ",",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color:
                                                  calculatorProvider.textcolor),
                                        )
                                      ],
                                    )),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1000.r)),
                                      gradient: CommonColor.textGradient),
                                  child: NeumorphicButton(
                                      onPressed: () {},
                                      style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(
                                                      1000.r)),
                                          depth: 2,
                                          intensity: 0.55,
                                          color: Colors.transparent),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "=",
                                            style: TextStyle(
                                                fontSize: 27.sp,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            ])),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
