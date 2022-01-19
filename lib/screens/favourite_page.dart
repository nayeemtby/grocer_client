import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/api/api.dart';
import 'package:grocer_client/screens/components/buttons.dart';
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
          child: FutureBuilder(
              initialData: const <String, dynamic>{
                'loading': true,
              },
              future: getJson('favourites'),
              builder: (context, snap) {
                Map<String, dynamic>? data = {
                  'loading': true,
                };
                if (snap.hasData) {
                  data = snap.data as Map<String, dynamic>;
                }
                if (snap.hasError || data['loading'] != null) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      radius: 14.r,
                    ),
                  );
                }
                List tmp = data.values.toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tmp.length,
                  itemBuilder: (ctx, index) {
                    return _FavouriteItem(
                      name: tmp[index]['name'],
                      price: tmp[index]['price'],
                      quantity: tmp[index]['quantity'],
                      imgurl: baseUrl + tmp[index]['img'],
                    );
                  },
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25.w, 4.h, 25.w, 14.h),
          child: BtnPrimary(
            txt: 'Add all to cart',
            onTap: () {},
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
