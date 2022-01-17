import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class ProductCounter extends StatelessWidget {
  const ProductCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.remove,
          size: 28.sp,
        ),
        SizedBox(
          width: 20.w,
        ),
        IntrinsicWidth(child: _ProductCountField()),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          Icons.add,
          size: 28.sp,
        ),
      ],
    );
  }
}

class _ProductCountField extends StatelessWidget {
  const _ProductCountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: TextInputType.number,
      maxLines: 1,
      maxLength: 4,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      style: TxtThemes.input,
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(width: 1.sp, color: AppColors.primaryGreen),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(width: 1.sp, color: AppColors.secondaryGrey),
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: 12.sp, horizontal: 18.sp),
      ),
    );
  }
}
