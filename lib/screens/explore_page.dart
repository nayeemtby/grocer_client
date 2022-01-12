import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/screens/category.dart';
import 'package:grocer_client/screens/components/explore_components.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.r,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.r,
            ),
            child: Text(
              'Explore Products',
              style: TxtThemes.headline,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 14.r,
            ),
            child: SearchBar(),
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
