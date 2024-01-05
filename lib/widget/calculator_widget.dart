import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphism_calculator/common/colors.dart';
import 'package:neumorphism_calculator/provider/calculator_provider.dart';

AppBar cAppbar(BuildContext context, CalculatorProvider calculatorProvider) {
    return AppBar(
      leadingWidth: 78.w,
      backgroundColor: NeumorphicTheme.of(context)!.isUsingDark ? CommonColor.blackBackgroundColor : CommonColor.whiteBackgroundColor,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 10.w
        ),
        child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: (){
                        calculatorProvider.changeTheme(context);
                        calculatorProvider.changeTextColor(context);
                        calculatorProvider.changeIconColor(context);
                      },
                      child: AbsorbPointer(
                        child: SizedBox(
                          child: DayNightSwitcher(
                                isDarkModeEnabled: NeumorphicTheme.of(context)!.isUsingDark,
                                onStateChanged: (isDarkModeEnabled) {
                                },
                          ),
                        ),
                      ),
                    ),
      ),
    );
  }