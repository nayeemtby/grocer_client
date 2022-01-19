import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/screens/controllers/cart_controller.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  CartController cartController = Get.put(CartController());

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
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'Your Cart Is Empty',
                    style: TxtThemes.title,
                  ),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return _CartItem();
                },
                separatorBuilder: (_, __) => Divider(
                  height: 2.h,
                ),
                itemCount: cartController.cartItems.length,
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25.w, 4.h, 25.w, 18.h),
          child: Obx(() {
            return BtnPrimary(
              onTap: cartController.cartItems.isEmpty ? null : () {},
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
                        color: const Color(0x44000000),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Obx(() {
                        return Text(
                          '\$' + cartController.total.toString(),
                          style: TxtThemes.iconLabel
                              .copyWith(color: AppColors.primaryWhite),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({
    Key? key,
    this.id,
    this.data,
  }) : super(key: key);
  final String? id;
  final CartItemData? data;
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
