import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';

class TxtThemes {
  static final TextStyle headline = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: AppColors.primaryBlack,
  );

  static final TextStyle title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: AppColors.primaryBlack,
  );

  static final TextStyle price = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    color: AppColors.primaryBlack,
  );

  static final TextStyle iconLabel = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    color: AppColors.primaryBlack,
  );
}

class TxtModels {
  static final TextStyle sb14 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static final TextStyle med14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
}
