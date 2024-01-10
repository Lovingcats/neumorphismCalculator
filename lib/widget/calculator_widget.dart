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
