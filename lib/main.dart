import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocer_client/screens/home.dart';

void main() {
  runApp(const GrocerApp());
}

class GrocerApp extends StatelessWidget {
  const GrocerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'BeVietnamPro',
        ),
        home: HomeScr(),
      ),
    );
  }
}
