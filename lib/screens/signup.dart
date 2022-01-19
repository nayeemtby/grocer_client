import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/screens/controllers/auth_controller.dart';
import 'package:grocer_client/screens/login.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class SignupScr extends StatefulWidget {
  SignupScr({Key? key}) : super(key: key);

  @override
  State<SignupScr> createState() => _SignupScrState();
}

class _SignupScrState extends State<SignupScr> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authController.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/auth_bg.png',
          ),
          fit: BoxFit.fill,
        ),
        color: AppColors.primaryWhite,
      ),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            if (!currentFocus.hasFocus || currentFocus.focusedChild == null) {
              return true;
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'images/carrot_colored.svg',
                          height: 56.r,
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      Text(
                        'Sign Up',
                        style: TxtThemes.headline2,
                      ),
                      SizedBox(
                        height: 14.r,
                      ),
                      Text(
                        'Create a new account with email',
                        style: TxtThemes.subtitle,
                      ),
                      SizedBox(
                        height: 40.r,
                      ),
                      TxtInput(
                        controller: authController.nameController,
                        label: 'Full Name',
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TxtInput(
                        controller: authController.emailController,
                        label: 'Email',
                        suffix: Obx(() {
                          return Icon(
                            Icons.check_rounded,
                            size: 24.sp,
                            color: GetUtils.isEmail(
                              authController.email.value,
                            )
                                ? AppColors.primaryGreen
                                : AppColors.primaryGrey,
                          );
                        }),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(() {
                        return TxtInput(
                          controller: authController.passwordController,
                          label: 'Password',
                          showText: authController.passwordVisible.value,
                          suffix: GestureDetector(
                            onTap: authController.togglePasswordVisibility,
                            child: Obx(() {
                              return Icon(
                                authController.passwordVisible.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                size: 24.sp,
                                color: AppColors.primaryGrey,
                              );
                            }),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By continuing you agree to our ',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.tertiaryGrey,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.primaryGreen,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.tertiaryGrey,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(() {
                        return BtnPrimary(
                          txt: 'Sign Up',
                          onTap: (authController.isValidCredentials.value &&
                                  authController.name.value.isNotEmpty)
                              ? () {}
                              : null,
                        );
                      }),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.primaryBlack,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (ctx) => LoginScr(),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TxtModels.med14.copyWith(
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
