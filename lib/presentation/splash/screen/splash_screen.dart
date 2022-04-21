import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../shared_components/default_gradient_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 45.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Strings.splashImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Text(
                    Strings.splashScreenDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize:20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultGradientButton(
                    isFilled: true,
                    text: Text(
                      'Create an Account',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRouter.signUp);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRouter.firstLogin);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
