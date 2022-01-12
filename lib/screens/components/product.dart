import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.price = '\$1.99',
    this.title = 'Product',
    this.quantity = '1 pcs',
  }) : super(key: key);
  final String price;
  final String title;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.sp,
            color: AppColors.secondaryGrey,
          ),
          borderRadius: BorderRadius.circular(18.sp)),
      child: SizedBox(
        height: 250.sp,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.sp,
            vertical: 16.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(width: double.infinity, child: FlutterLogo()),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Text(
                title,
                style: TxtThemes.title,
              ),
              SizedBox(
                height: 6.sp,
              ),
              Text(
                quantity,
                style: TxtModels.med14.copyWith(
                  color: AppColors.primaryGrey,
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TxtThemes.price,
                  ),
                  AddBtnIcon(
                    ontap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddBtnIcon extends StatelessWidget {
  const AddBtnIcon({Key? key, this.ontap}) : super(key: key);
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      16.sp,
    );
    return Material(
      color: AppColors.primaryGreen,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: ontap,
        borderRadius: borderRadius,
        child: Padding(
          padding: EdgeInsets.all(
            14.sp,
          ),
          child: Icon(
            Icons.add,
            size: 24.sp,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
