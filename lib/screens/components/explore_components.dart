import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.borderColor,
    required this.bgColor,
    this.txt = 'Category',
    this.onTap,
    this.path,
  }) : super(key: key);

  final Color borderColor;
  final Color bgColor;
  final String txt;
  final VoidCallback? onTap;
  final String? path;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18.r);
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
            color: borderColor,
            width: 1.sp,
          )),
      color: bgColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: SizedBox(
          height: 190.sp,
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: path == null
                        ? const FlutterLogo()
                        : Image.asset(
                            path!,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                SizedBox(
                  height: 16.sp,
                ),
                SizedBox(
                  height: 44.sp,
                  child: Center(
                    child: Text(
                      txt,
                      style: TxtThemes.title,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.accentGrey,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'Search Store',
          labelStyle: TxtModels.sb14.copyWith(
            color: AppColors.primaryGrey,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primaryBlack,
            size: 24.sp,
          ),
          contentPadding: EdgeInsets.all(
            16.sp,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
