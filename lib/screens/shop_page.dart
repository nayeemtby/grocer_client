import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocer_client/api/api.dart';
import 'package:grocer_client/screens/bestselling.dart';
import 'package:grocer_client/screens/components/product.dart';
import 'package:grocer_client/screens/controllers/shop_controller.dart';
import 'package:grocer_client/screens/offers.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  ShopController shopController = Get.put(ShopController());

  String currentCat = 'Beverage';
  void changeCat(String value) => setState(() => currentCat = value);

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
                      Obx(
                        () {
                          return GestureDetector(
                            onTap:
                                shopController.offers.value['loading'] == null
                                    ? () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (ctx) => OfferScr(
                                              data: shopController.offers.value,
                                            ),
                                          ),
                                        );
                                      }
                                    : null,
                            child: Text(
                              'See all',
                              style: TxtModels.sb16
                                  .copyWith(color: AppColors.primaryGreen),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Obx(() {
                    List tmp = shopController.offers.values.toList();
                    return shopController.offers.value['loading'] == null
                        ? Row(
                            children: [
                              Expanded(
                                child: ProductCard(
                                  title: tmp[0]['name'],
                                  price: tmp[0]['price'],
                                  quantity: tmp[0]['quantity'],
                                  url: baseUrl + tmp[0]['img'],
                                  discountPrice: tmp[0]['discountPrice'],
                                  id: tmp[0]['id'],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                  child: ProductCard(
                                title: tmp[1]['name'],
                                price: tmp[1]['price'],
                                quantity: tmp[1]['quantity'],
                                url: baseUrl + tmp[1]['img'],
                                discountPrice: tmp[1]['discountPrice'],
                                id: tmp[1]['id'],
                              )),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 250.h,
                                child: CupertinoActivityIndicator(
                                  radius: 14.r,
                                ),
                              ),
                            ],
                          );
                  }),
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
                      Obx(
                        () {
                          return GestureDetector(
                            onTap:
                                shopController.offers.value['loading'] == null
                                    ? () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (ctx) => BestsellingScr(
                                              data: shopController.offers.value,
                                            ),
                                          ),
                                        );
                                      }
                                    : null,
                            child: Text(
                              'See all',
                              style: TxtModels.sb16
                                  .copyWith(color: AppColors.primaryGreen),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Obx(() {
                    List tmp = shopController.bestselling.values.toList();
                    return shopController.bestselling.value['loading'] == null
                        ? Row(
                            children: [
                              Expanded(
                                child: ProductCard(
                                  title: tmp[0]['name'],
                                  price: tmp[0]['price'],
                                  quantity: tmp[0]['quantity'],
                                  url: baseUrl + tmp[0]['img'],
                                  id: baseUrl + tmp[0]['id'],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                  child: ProductCard(
                                title: tmp[1]['name'],
                                price: tmp[1]['price'],
                                quantity: tmp[1]['quantity'],
                                url: baseUrl + tmp[1]['img'],
                                id: baseUrl + tmp[1]['id'],
                              )),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 250.h,
                                child: CupertinoActivityIndicator(
                                  radius: 14.r,
                                ),
                              ),
                            ],
                          );
                  }),
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
                      Text(
                        'See all',
                        style: TxtModels.sb16
                            .copyWith(color: AppColors.primaryGreen),
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
                      _GroceryCard(
                        fill: CatColors.lightBlue,
                        name: 'Beverage',
                        imgpath: 'images/cat/bev.png',
                        radioValue: currentCat,
                        ontap: changeCat,
                      ),
                      _GroceryCard(
                        fill: CatColors.lightOrange,
                        name: 'Meat & Fish',
                        imgpath: 'images/cat/meat.png',
                        radioValue: currentCat,
                        ontap: changeCat,
                      ),
                      _GroceryCard(
                        fill: CatColors.lightGreen,
                        name: 'Vegetables',
                        imgpath: 'images/cat/veg.png',
                        radioValue: currentCat,
                        ontap: changeCat,
                      ),
                      _GroceryCard(
                        fill: CatColors.lightPurple,
                        name: 'Oil',
                        imgpath: 'images/cat/oil.png',
                        radioValue: currentCat,
                        ontap: changeCat,
                      ),
                      _GroceryCard(
                        fill: CatColors.lightYellow,
                        name: 'Dairy',
                        imgpath: 'images/cat/dairy.png',
                        radioValue: currentCat,
                        ontap: changeCat,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Obx(() {
                    List tmp = shopController.bestselling.value.values.toList();
                    return shopController.bestselling.value['loading'] == null
                        ? Row(
                            children: [
                              Expanded(
                                child: ProductCard(
                                  title: tmp[0]['name'],
                                  price: tmp[0]['price'],
                                  quantity: tmp[0]['quantity'],
                                  url: baseUrl + tmp[0]['img'],
                                  id: baseUrl + tmp[0]['id'],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                  child: ProductCard(
                                title: tmp[1]['name'],
                                price: tmp[1]['price'],
                                quantity: tmp[1]['quantity'],
                                url: baseUrl + tmp[1]['img'],
                                id: baseUrl + tmp[1]['id'],
                              )),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 250.h,
                                child: CupertinoActivityIndicator(
                                  radius: 14.r,
                                ),
                              ),
                            ],
                          );
                  }),
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
    this.imgpath,
    this.radioValue,
    this.ontap,
  }) : super(key: key);
  final String name;
  final Color fill;
  final String? imgpath;
  final String? radioValue;
  final void Function(String)? ontap;
  @override
  Widget build(BuildContext context) {
    bool selected;
    if (radioValue == null) {
      selected = false;
    } else {
      selected = radioValue == name;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: fill,
        borderRadius: BorderRadius.circular(18.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(18.r),
          onTap: () => ontap!(name),
          child: SizedBox(
            height: 105.h,
            width: 250.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.r, 15.r, 15.r, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 75.w,
                          child: imgpath == null
                              ? const FlutterLogo()
                              : Image.asset(imgpath!),
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
                ),
                AnimatedContainer(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  height: 6.h,
                  color: selected ? AppColors.primaryGreen : Colors.transparent,
                )
              ],
            ),
          ),
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
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
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
