import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocer_client/screens/home.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class SplashScr extends StatelessWidget {
  const SplashScr({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 1,
      ),
      () => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (ctx) => HomeScr(),
        ),
      ),
    );
    final double rad = 12.r, height = 72.h;
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: rad + height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/carrot_white.svg',
                height: 58.sp,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'grocer',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 48.sp,
                      color: AppColors.primaryWhite,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'online groceriet',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryWhite,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: height,
          ),
          CupertinoActivityIndicator(
            radius: rad,
          ),
        ],
      ),
    );
  }
}
