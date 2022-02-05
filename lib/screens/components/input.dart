import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/controllers/cart_controller.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class TxtInput extends StatelessWidget {
  const TxtInput({
    Key? key,
    required this.label,
    this.suffix,
    this.controller,
    this.showText = true,
  }) : super(key: key);
  final String label;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !showText,
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

class ProductCounter extends StatefulWidget {
  const ProductCounter({
    Key? key,
    required this.id,
    this.editable = true,
    required this.dataMessageController,
    required this.initialCount,
    this.onChanged,
  }) : super(key: key);
  final String id;
  final bool editable;
  final int initialCount;
  final CounterController dataMessageController;
  final void Function(String)? onChanged;

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  final CartController cartController = Get.put(CartController());

  final TextEditingController countController = TextEditingController();
  late int currentCount;
  @override
  void initState() {
    super.initState();
    countController.text = widget.initialCount.toString();
    currentCount = widget.initialCount;
    countController.addListener(() {
      if (countController.text == '' || int.parse(countController.text) < 1) {
        countController.text = '1';
      }
      if (widget.onChanged != null) {
        widget.onChanged!(countController.text);
      }
      widget.dataMessageController.count = countController.text;
      setState(() {
        currentCount = int.parse(countController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: currentCount > 1
              ? () => countController.text = (currentCount - 1).toString()
              : null,
          child: Icon(
            Icons.remove,
            size: 28.sp,
            color: currentCount > 1
                ? AppColors.primaryGreen
                : AppColors.primaryGrey,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        IntrinsicWidth(
          child: _ProductCountField(
            controller: countController,
            editable: widget.editable,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: currentCount < 9999
              ? () => countController.text = (currentCount + 1).toString()
              : null,
          child: Icon(
            Icons.add,
            size: 28.sp,
            color: currentCount < 9999
                ? AppColors.primaryGreen
                : AppColors.primaryGrey,
          ),
        ),
      ],
    );
  }
}

class _ProductCountField extends StatelessWidget {
  const _ProductCountField({
    Key? key,
    required this.controller,
    required this.editable,
  }) : super(key: key);
  final TextEditingController controller;
  final bool editable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      enabled: editable,
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

class CounterController {
  String count = '1';
}
