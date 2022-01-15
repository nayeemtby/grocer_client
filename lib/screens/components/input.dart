import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class TxtInput extends StatelessWidget {
  const TxtInput({
    Key? key,
    required this.label,
    this.suffix,
    this.controller,
  }) : super(key: key);
  final String label;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TxtThemes.input,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TxtThemes.hint,
        floatingLabelStyle: TxtThemes.subtitle,
        suffixIcon: suffix,
        contentPadding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 8.sp),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.primaryGreen.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
