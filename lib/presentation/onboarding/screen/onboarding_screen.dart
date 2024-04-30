import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import '../../shared_components/default_gradient_button.dart';
import '../../shared_components/gradient_background_container.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                  width: double.infinity,
                  child: const FlareActor(
                    'assets/flares/cloud_loading.flr',
                    animation: 'Sync',
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Text(
                  'Get Access to Real Mining Power Without Any Extra Effort',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                DefaultGradientButton(
                  isFilled: true,
                  text: Text(
                    'Create an Account',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.signUp);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultGradientButton(
                  isFilled: false,
                  text: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.firstLogin);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
