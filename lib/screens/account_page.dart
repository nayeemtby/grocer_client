import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32.r,
                child: FlutterLogo(),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Name',
                        style: TxtThemes.headline,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        size: 20.sp,
                        color: AppColors.primaryGreen,
                      )
                    ],
                  ),
                  Text(
                    'username@host.domain',
                    style: TxtThemes.subtitle
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.shopping_bag_outlined,
                txt: 'Orders',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.badge_outlined,
                txt: 'My Details',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.location_on_outlined,
                txt: 'Delivery Address',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.payment_outlined,
                txt: 'Payment Methods',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.card_giftcard_outlined,
                txt: 'Promo Codes',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.notifications_none_outlined,
                txt: 'Notifications',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.help_outline_outlined,
                txt: 'Help',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.info_outline,
                txt: 'About',
              ),
              Divider(
                height: 2.h,
              ),
              const _AccountButton(
                icon: Icons.exit_to_app_rounded,
                txt: 'Logout',
              ),
              Divider(
                height: 2.h,
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class _AccountButton extends StatelessWidget {
  const _AccountButton({
    Key? key,
    required this.icon,
    required this.txt,
  }) : super(key: key);
  final IconData icon;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24.sp,
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                txt,
                style: TxtThemes.input,
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24.sp,
          )
        ],
      ),
    );
  }
}
