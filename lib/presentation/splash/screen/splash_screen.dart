import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../shared_components/default_gradient_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: s.w(16.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: s.h(394.0),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Strings.splashImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: s.h(20.0),
                  ),
                  Text(
                    Strings.splashScreenDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(26.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: s.h(42.0),
                  ),
                  DefaultGradientButton(
                    isFilled: true,
                    text: Text(
                      'Create an Account',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(19.0),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.signUp);
                    },
                  ),
                  SizedBox(
                    height: s.h(15.5),
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(19.0),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.logIn);
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
