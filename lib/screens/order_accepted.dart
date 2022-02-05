import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/theme/txttheme.dart';

class OrderAcceptedScr extends StatelessWidget {
  const OrderAcceptedScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/auth_bg.png'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/check_circle.svg',
                    height: 160.r,
                  ),
                  SizedBox(height: 70.h),
                  Text(
                    'Your order has been accepted',
                    style: TxtThemes.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your items has been placcd and is on it\'s way to being processed',
                    style: TxtThemes.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            BtnPrimary(
              txt: 'Track Order',
              onTap: () {},
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Center(
                  child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Back to home',
                  style: TxtThemes.title,
                ),
              )),
            ),
            SizedBox(
              height: 25.h,
            )
          ],
        ),
      ),
    );
  }
}
