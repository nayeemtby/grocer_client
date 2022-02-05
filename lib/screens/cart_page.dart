import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/screens/controllers/cart_controller.dart';
import 'package:grocer_client/screens/order_accepted.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());

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
              List keys = cartController.cartItems.keys.toList();
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return _CartItem(
                    id: keys[index],
                    data: cartController.cartItems[keys[index]],
                    ontap: cartController.removeItem,
                    cartController: cartController,
                  );
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
              onTap: cartController.cartItems.isEmpty
                  ? null
                  : () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => _CheckoutSheet(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        isScrollControlled: true,
                      );
                    },
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
                          '\$' + cartController.total.toStringAsFixed(2),
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
  _CartItem({
    Key? key,
    required this.id,
    this.data,
    required this.ontap,
    required this.cartController,
  }) : super(key: key);
  final String id;
  final CartItemData? data;
  final void Function(String) ontap;
  final CounterController counterController = CounterController();
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        children: [
          Center(
            child: SizedBox.square(
              dimension: 65.r,
              child: data?.img == null
                  ? const FlutterLogo()
                  : CachedNetworkImage(imageUrl: data!.img!),
            ),
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
                      (data?.name) ?? 'Product',
                      style: TxtThemes.title,
                    ),
                    GestureDetector(
                      onTap: () => ontap(id),
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data == null ? '-- unit' : data!.quantity,
                    style: TxtThemes.subtitle,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductCounter(
                      editable: false,
                      id: id,
                      initialCount: data == null ? 1 : data!.units,
                      dataMessageController: counterController,
                      onChanged: (String newdata) =>
                          cartController.updateItem(id, int.parse(newdata)),
                    ),
                    Text(
                      data == null ? '\$' : '\$' + data!.price,
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

class _CheckoutSheet extends StatelessWidget {
  _CheckoutSheet({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Checkout',
                  style: TxtThemes.headline2.copyWith(fontSize: 24.sp),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 28.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Divider(
            height: 0,
            thickness: 1.h,
          ),
          _CheckoutSheetBtn(
            children: [
              Text(
                'Delivery Location',
                style: TxtThemes.hint,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select One',
                    style: TxtThemes.input.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 28.sp,
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 0,
            thickness: 1.h,
          ),
          _CheckoutSheetBtn(
            children: [
              Text(
                'Payment Method',
                style: TxtThemes.hint,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cash On Delivery',
                    style: TxtThemes.input.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 28.sp,
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 0,
            thickness: 1.h,
          ),
          _CheckoutSheetBtn(
            children: [
              Text(
                'Promo Code',
                style: TxtThemes.hint,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select One',
                    style: TxtThemes.input.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 28.sp,
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 0,
            thickness: 1.h,
          ),
          _CheckoutSheetBtn(
            children: [
              Text(
                'Total Cost',
                style: TxtThemes.hint,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 14.w + 24.sp,
                ),
                child: Text(
                  '\$' + cartController.total.toStringAsFixed(2),
                  style: TxtThemes.input.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
          Divider(
            height: 0,
            thickness: 1.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By placing an order you agree to our ',
                  style: TxtModels.med14.copyWith(
                    color: AppColors.tertiaryGrey,
                  ),
                ),
                TextSpan(
                  text: 'Terms and Coditions',
                  style: TxtModels.med14.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: BtnPrimary(
              txt: 'Place Order',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ctx) => const OrderAcceptedScr(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutSheetBtn extends StatelessWidget {
  const _CheckoutSheetBtn({
    Key? key,
    required this.children,
    this.ontap,
  }) : super(key: key);
  final List<Widget> children;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: ontap ?? () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }
}
