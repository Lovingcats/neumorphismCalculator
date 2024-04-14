import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphism_calculator/common/colors.dart';
import 'package:neumorphism_calculator/provider/calculator_provider.dart';
import 'package:neumorphism_calculator/widget/gradint_text.dart';

AppBar cAppbar(BuildContext context, CalculatorProvider calculatorProvider) {
  return AppBar(
    leadingWidth: 80.w,
    backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
        ? CommonColor.blackBackgroundColor
        : CommonColor.whiteBackgroundColor,
    leading: Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          calculatorProvider.changeTheme(context);
          calculatorProvider.changeTextColor(context);
          calculatorProvider.changeIconColor(context);
        },
        child: AbsorbPointer(
          child: SizedBox(
            child: DayNightSwitcher(
              isDarkModeEnabled: NeumorphicTheme.of(context)!.isUsingDark,
              onStateChanged: (isDarkModeEnabled) {},
            ),
          ),
        ),
      ),
    ),
  );
}

Padding cCalculateText(CalculatorProvider calculatorProvider) {
  return Padding(
    padding: EdgeInsets.only(top: 85.h, right: 15.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GradientText(
              "2,020 x 2 - 1,942",
              gradient: CommonColor.textGradient,
              style: TextStyle(fontSize: 13.sp),
            ),
            Text(
              "2,098",
              style: TextStyle(
                  fontSize: 50.sp,
                  color: calculatorProvider.textcolor,
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    ),
  );
}

Widget makeFlexButton(String text, bool isGradient,
    CalculatorProvider calculatorProvider, int flex) {
  return Flexible(
    fit: FlexFit.tight,
    flex: flex,
    child: flex == 2
        ? Container(
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1000.r)),
                gradient: CommonColor.textGradient),
            child: NeumorphicButton(
                onPressed: () {},
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(1000.r)),
                    depth: 2,
                    intensity: 0.55,
                    color: Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "=",
                      style: TextStyle(fontSize: 27.sp, color: Colors.white),
                    ),
                  ],
                )),
          )
        : NeumorphicButton(
            margin: EdgeInsets.all(10.w),
            onPressed: () {},
            style: const NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.circle(),
              depth: 2,
              intensity: 0.55,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isGradient
                    ? GradientText(
                        text,
                        gradient: CommonColor.textGradient,
                        style: TextStyle(fontSize: 20.sp),
                      )
                    : Text(
                        text,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: calculatorProvider.textcolor),
                      )
              ],
            )),
  );
}

Flexible cNumber(BuildContext context, CalculatorProvider calculatorProvider) {
  return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin:
            EdgeInsets.only(top: 25.h, bottom: 40.h, left: 12.w, right: 12.w),
        width: double.infinity.w,
        child: Column(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  makeFlexButton("C", true, calculatorProvider, 1),
                  makeFlexButton("+/-", true, calculatorProvider, 1),
                  makeFlexButton("%", true, calculatorProvider, 1),
                  makeFlexButton("÷", true, calculatorProvider, 1),
                ])),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  makeFlexButton("7", false, calculatorProvider, 1),
                  makeFlexButton("8", false, calculatorProvider, 1),
                  makeFlexButton("9", false, calculatorProvider, 1),
                  makeFlexButton("×", true, calculatorProvider, 1),
                ])),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  makeFlexButton("4", false, calculatorProvider, 1),
                  makeFlexButton("5", false, calculatorProvider, 1),
                  makeFlexButton("6", false, calculatorProvider, 1),
                  makeFlexButton("-", true, calculatorProvider, 1),
                ])),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  makeFlexButton("1", false, calculatorProvider, 1),
                  makeFlexButton("2", false, calculatorProvider, 1),
                  makeFlexButton("3", false, calculatorProvider, 1),
                  makeFlexButton("+", true, calculatorProvider, 1),
                ])),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(children: [
                  makeFlexButton("0", false, calculatorProvider, 1),
                  makeFlexButton(",", false, calculatorProvider, 1),
                  makeFlexButton("=", false, calculatorProvider, 2),
                ])),
          ],
        ),
      ));
}
