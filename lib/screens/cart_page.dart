import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: Text(
                'My Cart',
                style: TxtThemes.headline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Divider(
          height: 2.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return _CartItem();
              },
              separatorBuilder: (_, __) => Divider(
                height: 2.h,
              ),
              itemCount: 10,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25.w, 4.h, 25.w, 18.h),
          child: BtnPrimary(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.sp,
                  ),
                  Text(
                    'Go to checkout',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColors.tertiaryWhite,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xff489E67),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      '\$123',
                      style: TxtThemes.iconLabel
                          .copyWith(color: AppColors.primaryWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: FlutterLogo(),
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product',
                      style: TxtThemes.title,
                    ),
                    Icon(Icons.close),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-- unit',
                    style: TxtThemes.subtitle,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductCounter(),
                    Text(
                      '\$',
                      style: TxtThemes.price,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
