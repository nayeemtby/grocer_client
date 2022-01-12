import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/screens/components/product.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CategoryScr extends StatelessWidget {
  const CategoryScr({
    Key? key,
    this.category = 'Category',
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.r,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 24.sp,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    Text(
                      category,
                      style: TxtThemes.headline,
                    ),
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 24.sp,
                      color: AppColors.primaryBlack,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 6.sp,
              ),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (ctx, index) => Row(
                  children: [
                    const Expanded(
                      child: ProductCard(),
                    ),
                    SizedBox(
                      width: 15.r,
                    ),
                    Expanded(
                      child: Center(child: ProductCard()),
                    ),
                  ],
                ),
                separatorBuilder: (ctx, index) => SizedBox(
                  height: 15.r,
                ),
                itemCount: 6,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
