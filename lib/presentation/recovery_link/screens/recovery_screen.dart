import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/router/app_router.dart';

import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({
    Key? key,
    /*required this.email*/
  }) : super(key: key);

  //final String email;
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: s.w(16.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: s.h(88.0),
                        width: s.w(88.0),
                        child: SvgPicture.asset(
                          Strings.msgImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.h(16.0),
                  ),
                  Text(
                    Strings.recoveryLinkSent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(30.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: s.h(8.0),
                  ),
                  Text(
                    Strings.recoveryMsg,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(16.0),
                        ),
                  ),
                  SizedBox(
                    height: s.h(32.0),
                  ),
                  DefaultGradientButton(
                    isFilled: false,
                    text: const Text('Back To Login Page'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouter.enterNewPass);
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
