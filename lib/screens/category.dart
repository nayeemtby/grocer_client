import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/api/api.dart';
import 'package:grocer_client/screens/components/product.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CategoryScr extends StatelessWidget {
  const CategoryScr({
    Key? key,
    this.catName = 'Beverages',
    this.cat = 'bev',
  }) : super(key: key);
  final String catName;
  final String cat;

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
                      catName,
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
                child: FutureBuilder(
                  future: getCat(cat),
                  initialData: const {
                    'loading': true,
                  },
                  builder: (context, snap) {
                    Map<String, dynamic> data = {};
                    List prods = [];
                    if (snap.hasData) {
                      data =
                          (snap.data ?? {'null': true}) as Map<String, dynamic>;
                      prods.addAll(data.values);
                    }
                    if (snap.hasError) {
                      print(snap.error);
                    }
                    return data['loading'] != null
                        ? Center(
                            child: CupertinoActivityIndicator(
                              radius: 10.sp,
                            ),
                          )
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: prods.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 251.sp,
                              crossAxisSpacing: 14.sp,
                              mainAxisSpacing: 16.sp,
                            ),
                            itemBuilder: (ctx, index) {
                              return ProductCard(
                                price: prods[index]['price'],
                                quantity: prods[index]['quantity'],
                                title: prods[index]['name'],
                                url: baseUrl + prods[index]['img'],
                              );
                            },
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
