import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../shared_components/default_gradient_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.w(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: s.h(88.0),
              ),
              SizedBox(
                height: s.h(394.0),
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/splash_image.svg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: s.h(20.0),
              ),
              Text(
                'Get Access to Real Mining Power Without Any Extra Effort',
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
                onPressed: () {},
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
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
