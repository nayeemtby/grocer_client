import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/screens/controllers/cart_controller.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class DetailsScr extends StatefulWidget {
  DetailsScr({
    Key? key,
    this.quantity = '-- unit',
    this.price = '1.99',
    this.imgurl,
    this.name = 'Product',
    required this.id,
  }) : super(key: key);

  final String id;
  final String name;
  final String quantity;
  final String price;
  final String? imgurl;
  final CounterController counterController = CounterController();

  @override
  State<DetailsScr> createState() => _DetailsScrState();
}

class _DetailsScrState extends State<DetailsScr> {
  final CartController cartController = Get.put(CartController());
  int units = 1;
  bool favourite = false;
  void updateUnit(String newUnit) {
    if (units.toString() != newUnit) {
      setState(() {
        units = int.parse(newUnit);
      });
    }
  }

  void toggleFavourite() {
    setState(() {
      favourite = !favourite;
    });
  }

  @override
  void initState() {
    super.initState();
    if (cartController.cartItems[widget.id] != null) {
      units = cartController.cartItems[widget.id]!.units;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.accentGrey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.accentGrey,
          leading: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryBlack,
            size: 24.sp,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Icon(
                Icons.share_rounded,
                color: AppColors.primaryBlack,
                size: 24.sp,
              ),
            ),
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(10.r),
                width: double.infinity,
                height: 0.3 * constraints.maxHeight,
                child: widget.imgurl == null
                    ? const FlutterLogo()
                    : CachedNetworkImage(imageUrl: widget.imgurl!),
              ),
              Expanded(
                child: Material(
                  color: AppColors.primaryWhite,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.name,
                                  style: TxtThemes.title.copyWith(
                                    fontSize: 24.sp,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: toggleFavourite,
                                  child: Icon(
                                    favourite
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    size: 24.sp,
                                    color: Colors.redAccent[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.quantity,
                                style: TxtModels.med14.copyWith(
                                  color: AppColors.primaryGrey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductCounter(
                                  id: widget.id,
                                  initialCount: units,
                                  dataMessageController:
                                      widget.counterController,
                                ),
                                Text(
                                  '\$' + widget.price,
                                  style: TxtThemes.headline
                                      .copyWith(fontSize: 24.sp),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            height: 1.h,
                          ),
                          _DetailExpansionTile(
                            children: [
                              Text(
                                'Product Detail',
                                style: TxtModels.sb16.copyWith(
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              SizedBox(
                                width: 18.sp,
                              ),
                            ],
                          ),
                          Divider(
                            height: 1.h,
                          ),
                          _DetailExpansionTile(
                            children: [
                              Text(
                                'Nutritions',
                                style: TxtModels.sb16.copyWith(
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4.r),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffebebeb),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Text(
                                      '100gr',
                                      style: TxtThemes.subtitle
                                          .copyWith(fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height: 1.h,
                          ),
                          _DetailExpansionTile(
                            children: [
                              Text(
                                'Review',
                                style: TxtModels.sb16.copyWith(
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              _Rating(
                                rating: 3.9,
                                color: CatColors.orange.withAlpha(255),
                              )
                            ],
                          ),
                          Divider(
                            height: 1.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: AppColors.primaryWhite,
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 20.h,
                ),
                child: BtnPrimary(
                  txt: 'Add To Cart',
                  onTap: () {
                    cartController.add(
                      widget.id,
                      CartItemData(
                        img: widget.imgurl,
                        name: widget.name,
                        price: widget.price,
                        quantity: widget.quantity,
                        units: int.parse(widget.counterController.count),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({
    Key? key,
    required this.rating,
    required this.color,
  }) : super(key: key);
  final double rating;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final int filled = rating.toInt();
    final double partial = rating - filled;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(5, (index) {
        if (index < filled) {
          return Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Icon(
              Icons.star,
              size: 20.sp,
              color: color,
            ),
          );
        } else if (index == filled) {
          return Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.star_outlined,
                  size: 20.sp,
                  color: color.withOpacity(0.4),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      colors: [color, color, color.withOpacity(0)],
                      stops: [0, (partial * 0.4) + 0.3, (partial * 0.4) + 0.3],
                    ).createShader(rect);
                  },
                  child: Icon(
                    Icons.star,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Icon(
            Icons.star_rounded,
            size: 20.sp,
            color: color.withOpacity(0.4),
          ),
        );
      }),
    );
  }
}

class _DetailExpansionTile extends StatefulWidget {
  const _DetailExpansionTile({
    Key? key,
    required this.children,
    this.expandedChild,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);
  final List<Widget> children;
  final Widget? expandedChild;
  final Alignment alignment;

  @override
  State<_DetailExpansionTile> createState() => _DetailExpansionTileState();
}

class _DetailExpansionTileState extends State<_DetailExpansionTile>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animationController.animateTo(0, duration: const Duration(milliseconds: 0));
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
    animationController.animateTo(isExpanded ? 1 : 0);
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            splashFactory: InkRipple.splashFactory,
            onTap: toggleExpansion,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.children,
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: widget.alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: animationController,
                curve: Curves.easeInOut,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: widget.expandedChild ??
                    FlutterLogo(
                      size: 32.sp,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
