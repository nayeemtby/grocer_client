import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocer_client/screens/components/product.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {
      setState(() {});
    });
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'images/carrot_colored.svg',
                height: 30.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18.sp,
                    color: const Color(0xff4C4F4D),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    'Dhaka, Banasree',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4C4F4D),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LayoutBuilder(builder: (context, _constraints) {
                  final double _padding = 25.w;
                  final double _height =
                      (_constraints.maxWidth - (_padding * 2)) * 0.3134;
                  return SizedBox(
                    height: _height,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      TabBarView(
                        controller: _tabController,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: _padding),
                            child: Image.asset('images/banner.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: _padding),
                            child: Image.asset('images/banner.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: _padding),
                            child: Image.asset('images/banner.png'),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: _height * 0.08,
                        child: Builder(builder: (context) {
                          return _CarouselPosition(
                              tabController: _tabController);
                        }),
                      )
                    ]),
                  );
                }),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exclusive Offer',
                        style: TxtThemes.headline2.copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        'See all',
                        style: TxtModels.sb16
                            .copyWith(color: AppColors.primaryGreen),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Expanded(child: ProductCard()),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(child: ProductCard()),
                    ],
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
                      Text(
                        'Best Selling',
                        style: TxtThemes.headline2.copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        'See all',
                        style: TxtModels.sb16
                            .copyWith(color: AppColors.primaryGreen),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Expanded(child: ProductCard()),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(child: ProductCard()),
                    ],
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
                      Text(
                        'Groceries',
                        style: TxtThemes.headline2.copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'See all',
                        style: TxtModels.sb16
                            .copyWith(color: AppColors.primaryGreen),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _GroceryCard(),
                      _GroceryCard(
                        fill: CatColors.lightBlue,
                        name: 'Rice',
                      ),
                      _GroceryCard(
                        fill: CatColors.lightGreen,
                        name: 'Vegetables',
                      ),
                      _GroceryCard(
                        fill: CatColors.lightPurple,
                        name: 'Oil',
                      ),
                      _GroceryCard(
                        fill: CatColors.lightYellow,
                        name: 'Dairy',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Expanded(child: ProductCard()),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(child: ProductCard())
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _GroceryCard extends StatelessWidget {
  const _GroceryCard({
    Key? key,
    this.name = 'Pulses',
    this.fill = CatColors.lightOrange,
    this.imgurl,
  }) : super(key: key);
  final String name;
  final Color fill;
  final String? imgurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Container(
        height: 105.h,
        width: 250.w,
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 75.w,
              child: FlutterLogo(),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              name,
              style: TxtThemes.headline.copyWith(
                color: AppColors.primaryGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CarouselPosition extends StatelessWidget {
  const _CarouselPosition({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _tabController.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 150),
            height: 5.r,
            width: index == _tabController.index ? 10.r : 5.r,
            decoration: BoxDecoration(
              color: index == _tabController.index
                  ? AppColors.primaryGreen
                  : AppColors.primaryGrey,
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        ),
      ),
    );
  }
}
