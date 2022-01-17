import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class DetailsScr extends StatelessWidget {
  const DetailsScr({
    Key? key,
    this.quantity = '-- unit',
    this.price = '1.99',
    this.imgurl,
    this.name = 'Product',
  }) : super(key: key);

  final String name;
  final String quantity;
  final String price;
  final String? imgurl;
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
                child: imgurl == null
                    ? const FlutterLogo()
                    : CachedNetworkImage(imageUrl: imgurl!),
              ),
              Expanded(
                child: Material(
                  color: AppColors.primaryWhite,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(26.w, 25.h, 25.w, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TxtThemes.title.copyWith(
                                  fontSize: 24.sp,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border_outlined,
                                size: 24.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              quantity,
                              style: TxtModels.med14.copyWith(
                                color: AppColors.primaryGrey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCounter(),
                              Text(
                                '\$' + price,
                                style: TxtThemes.headline
                                    .copyWith(fontSize: 24.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product Detail',
                                style: TxtModels.sb16.copyWith(
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18.sp,
                              )
                            ],
                          ),
                          Divider(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18.sp,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review',
                                style: TxtModels.sb16.copyWith(
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: CatColors.orange,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: CatColors.orange,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: CatColors.orange,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: CatColors.orange,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: CatColors.orange,
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18.sp,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height: 36.h,
                          ),
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
                  txt: 'Add To Basket',
                  onTap: () {},
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
