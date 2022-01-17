import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/screens/details.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: Text(
                'Favourites',
                style: TxtThemes.headline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Divider(
          height: 2.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return _FavouriteItem();
            },
          ),
        )
      ],
    );
  }
}

class _FavouriteItem extends StatelessWidget {
  const _FavouriteItem({
    Key? key,
    this.name = 'Product',
    this.quantity = '-- unit',
    this.imgurl,
    this.price = '1.99',
  }) : super(key: key);
  final String name;
  final String quantity;
  final String? imgurl;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (ctx) => DetailsScr(
                imgurl: imgurl,
                name: name,
                price: price,
                quantity: quantity,
              ),
            ),
          ),
          leading: SizedBox(
            width: 80.w,
            child: imgurl == null
                ? const FlutterLogo()
                : CachedNetworkImage(imageUrl: imgurl!),
          ),
          title: Text(
            name,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: TxtThemes.title,
          ),
          subtitle: Text(
            quantity,
            style: TxtThemes.subtitle,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$' + price,
                style: TxtThemes.price,
              ),
              SizedBox(
                width: 12.w,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
                color: AppColors.primaryBlack,
              )
            ],
          ),
        )
      ],
    );
  }
}
