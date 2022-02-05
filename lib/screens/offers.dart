import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/api/api.dart';
import 'package:grocer_client/screens/components/product.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class OfferScr extends StatelessWidget {
  const OfferScr({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    List tmp = data.values.toList();
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
                      'Offers',
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
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tmp.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 251.sp,
                    crossAxisSpacing: 14.sp,
                    mainAxisSpacing: 16.sp,
                  ),
                  itemBuilder: (ctx, index) {
                    return ProductCard(
                      price: tmp[index]['price'],
                      quantity: tmp[index]['quantity'],
                      title: tmp[index]['name'],
                      url: baseUrl + tmp[index]['img'],
                      discountPrice: tmp[index]['discountPrice'],
                      id: tmp[index]['id'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
