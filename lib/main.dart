import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context, Widget? child) => const MaterialApp(
              title: 'StudyingTimer',
              supportedLocales: [Locale('ko', 'KR')],
              locale: Locale('ko'),
              debugShowCheckedModeBanner: false,
              home: Calculator(),
            ));
  }
}
