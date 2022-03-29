import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/router/app_router.dart';

import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

class RecoveryLinkScreen extends StatelessWidget {
  const RecoveryLinkScreen({
    Key? key,
    /*required this.email*/
  }) : super(key: key);

  //final String email;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25.w,
                        width: 25.w,
                        child: SvgPicture.asset(
                          Strings.msgImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    Strings.recoveryLinkSent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    Strings.recoveryMsg,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: Text(
                      'Back To Login Page',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13.sp,
                          ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouter.enterNewPassword);
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
