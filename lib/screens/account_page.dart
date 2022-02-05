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
        Divider(
          height: 2.h,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AccountButton(
                icon: Icons.shopping_bag_outlined,
                txt: 'Orders',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.badge_outlined,
                txt: 'My Details',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.location_on_outlined,
                txt: 'Delivery Address',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.payment_outlined,
                txt: 'Payment Methods',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.card_giftcard_outlined,
                txt: 'Promo Codes',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.notifications_none_outlined,
                txt: 'Notifications',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.help_outline_outlined,
                txt: 'Help',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.info_outline,
                txt: 'About',
                ontap: () {},
              ),
              const Divider(
                height: 0,
              ),
              _AccountButton(
                icon: Icons.exit_to_app_rounded,
                txt: 'Logout',
                ontap: () {},
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
    this.ontap,
  }) : super(key: key);
  final IconData icon;
  final String txt;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: ontap ?? () {},
        splashFactory: InkRipple.splashFactory,
        child: Padding(
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
        ),
      ),
    );
  }
}
