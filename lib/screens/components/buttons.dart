import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    this.child,
    this.txt = 'Button',
    this.onTap,
  }) : super(key: key);
  final Widget? child;
  final String txt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        child: child ??
            Text(
              txt,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColors.tertiaryWhite,
              ),
            ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryGreen,
          padding: EdgeInsets.symmetric(
            vertical: 24.sp,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18.r,
            ),
          ),
        ),
      ),
    );
  }
}
