import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/controllers/home_controller.dart';
import 'package:grocer_client/screens/explore_page.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class HomeScr extends StatelessWidget {
  HomeScr({Key? key}) : super(key: key);

  final HomeController homeController = Get.isRegistered()
      ? Get.find()
      : Get.put(
          HomeController(),
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _AppBottomNavigationBar(
        controller: homeController,
      ),
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: _HomeBody(
              controller: homeController,
            )),
      ),
    );
  }
}

class _AppBottomNavigationBar extends StatelessWidget {
  final HomeController controller;
  const _AppBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: true,
        selectedLabelStyle: TxtThemes.iconLabel,
        unselectedLabelStyle: TxtThemes.iconLabel,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.primaryBlack,
        iconSize: 24.sp,
        currentIndex: controller.currentNavigationTab.value,
        onTap: controller.bottomNavigationBarOnTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_outlined,
            ),
            label: 'Shop',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
            ),
            label: 'Explore',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
            ),
            label: 'Favourite',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: 'Account',
            tooltip: '',
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(),
              Text('Shop'),
            ],
          ),
          const ExplorePage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FlutterLogo(), Text('Cart')],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FlutterLogo(), Text('Favourite')],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FlutterLogo(), Text('Profile')],
          ),
        ],
      ),
    );
  }
}
