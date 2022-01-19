import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/home.dart';
import 'package:grocer_client/screens/login.dart';
import 'package:grocer_client/theme/colors.dart';

class OnboardScr extends StatelessWidget {
  const OnboardScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 90.h,
          horizontal: 30.w,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/onboard_bg.png',
            ),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'images/carrot_white.svg',
              height: 56.r,
            ),
            Text(
              'Welcome\nto our store',
              style: TextStyle(
                fontSize: 48.r,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryWhite,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'Get your groceries in as fast as one hour',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.r,
                color: AppColors.secondaryWhite,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            BtnPrimary(
              txt: 'Get Started',
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) => LoginScr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
