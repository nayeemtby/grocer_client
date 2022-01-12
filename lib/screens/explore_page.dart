import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/category.dart';
import 'package:grocer_client/screens/components/explore_components.dart';
import 'package:grocer_client/screens/controllers/explore_controller.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

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
  @override
  bool get wantKeepAlive => true;
  late final AnimationController titleAnimationController;
  late final AnimationController iconAnimationController;
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
                    ),
                    onFocusChange: widget.exploreController.searchFocusChanged,
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
              child: ListView.separated(
            itemBuilder: (ctx, index) => Row(
              children: [
                const Expanded(
                  child: CategoryCard(
                    borderColor: CatColors.green,
                    bgColor: CatColors.lightGreen,
                  ),
                ),
                SizedBox(
                  width: 15.r,
                ),
                Expanded(
                  child: CategoryCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (ctx) => CategoryScr(),
                        ),
                      );
                    },
                    borderColor: CatColors.green,
                    bgColor: CatColors.lightGreen,
                    txt: 'Fresh Fruits & Vegetables',
                  ),
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
    );
  }
}
