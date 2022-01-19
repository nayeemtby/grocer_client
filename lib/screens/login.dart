import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocer_client/screens/components/buttons.dart';
import 'package:grocer_client/screens/components/input.dart';
import 'package:grocer_client/screens/controllers/auth_controller.dart';
import 'package:grocer_client/screens/home.dart';
import 'package:grocer_client/screens/signup.dart';
import 'package:grocer_client/theme/colors.dart';
import 'package:grocer_client/theme/txttheme.dart';

class LoginScr extends StatefulWidget {
  const LoginScr({Key? key}) : super(key: key);

  @override
  State<LoginScr> createState() => _LoginScrState();
}

class _LoginScrState extends State<LoginScr> {
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
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                        'Login',
                        style: TxtThemes.headline2,
                      ),
                      SizedBox(
                        height: 14.r,
                      ),
                      Text(
                        'Enter your email and password',
                        style: TxtThemes.subtitle,
                      ),
                      SizedBox(
                        height: 40.r,
                      ),
                      TxtInput(
                        controller: authController.emailController,
                        label: 'Email',
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TxtModels.med14.copyWith(
                            color: AppColors.primaryBlack,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Obx(() {
                        return BtnPrimary(
                          txt: 'Log In',
                          onTap: authController.isValidCredentials.value
                              ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (ctx) => HomeScr(),
                                    ),
                                  );
                                }
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
                              'Don\'t have an account? ',
                              style: TxtModels.med14.copyWith(
                                color: AppColors.primaryBlack,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (ctx) => SignupScr(),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
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
