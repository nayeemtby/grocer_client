import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/api/api.dart';
import 'package:grocer_client/screens/category.dart';
import 'package:grocer_client/screens/components/explore_components.dart';
import 'package:grocer_client/screens/controllers/explore_controller.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';
import 'components/product.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  final ExploreController exploreController = Get.isRegistered()
      ? Get.find()
      : Get.put(
          ExploreController(),
        );

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final AnimationController titleAnimationController;
  late final AnimationController iconAnimationController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    titleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    widget.exploreController.titleAnimationController =
        titleAnimationController;
    widget.exploreController.iconAnimationController = iconAnimationController;
    titleAnimationController.animateTo(
      1,
      duration: const Duration(
        milliseconds: 0,
      ),
    );
    iconAnimationController.animateTo(
      0,
      duration: const Duration(
        milliseconds: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.r,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: titleAnimationController,
                  curve: Curves.ease,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.r,
                  ),
                  child: Text(
                    'Explore Products',
                    style: TxtThemes.headline,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 14.r,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FocusScope(
                    child: SearchBar(
                      controller: widget.exploreController.searchTextController,
                      searchActive: widget.exploreController.searchActive,
                      closeSearch: widget.exploreController.closeSearch,
                      searchValueChangeHandler:
                          widget.exploreController.searchValueChangeHandler,
                    ),
                    onFocusChange:
                        widget.exploreController.searchFocusChangeHandler,
                  ),
                ),
                SizeTransition(
                  sizeFactor: CurvedAnimation(
                    parent: iconAnimationController,
                    curve: Curves.ease,
                  ),
                  axis: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.sp,
                    ),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      size: 24.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return IndexedStack(
                  index: widget.exploreController.searchActive.value ? 0 : 1,
                  children: [
                    _SearchSegment(
                      controller: widget.exploreController,
                    ),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 190.sp,
                        crossAxisSpacing: 15.r,
                        mainAxisSpacing: 15.r,
                      ),
                      children: catCards,
                      physics: const BouncingScrollPhysics(),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  late List<Widget> catCards = [
    CategoryCard(
      borderColor: CatColors.green,
      bgColor: CatColors.lightGreen,
      path: 'images/cat/veg.png',
      txt: 'Fresh Fruits & Vegetables',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.orange,
      bgColor: CatColors.lightOrange,
      path: 'images/cat/oil.png',
      txt: 'Cooking Oil & Ghee',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.red,
      bgColor: CatColors.lightRed,
      path: 'images/cat/meat.png',
      txt: 'Meat & Fish',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.purple,
      bgColor: CatColors.lightPurple,
      path: 'images/cat/snack.png',
      txt: 'Bakery & Snacks',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.yellow,
      bgColor: CatColors.lightYellow,
      path: 'images/cat/dairy.png',
      txt: 'Dairy & Eggs',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.blue,
      bgColor: CatColors.lightBlue,
      path: 'images/cat/bev.png',
      txt: 'Beverages',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.red,
      bgColor: CatColors.lightGreen,
      path: 'images/cat/veg.png',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
    CategoryCard(
      borderColor: CatColors.orange,
      bgColor: CatColors.lightGreen,
      path: 'images/cat/veg.png',
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const CategoryScr(),
        ),
      ),
    ),
  ];
}

class _SearchSegment extends StatelessWidget {
  const _SearchSegment({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ExploreController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.searchList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 251.sp,
          crossAxisSpacing: 14.sp,
          mainAxisSpacing: 16.sp,
        ),
        itemBuilder: (ctx, index) {
          return ProductCard(
            price: '\$' + controller.searchList[index]['price'],
            quantity: controller.searchList[index]['quantity'],
            title: controller.searchList[index]['name'],
            url: baseUrl + controller.searchList[index]['img'],
          );
        },
      ),
    );
  }
}
