import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';

import '../../sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
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
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(30.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  const DefaultTextField(
                    text: 'Email',
                  ),
                  SizedBox(
                    height: s.h(20.0),
                  ),
                  const DefaultTextField(
                    text: 'Password',
                    isObscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined,
                  ),
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget your Password?',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(15.0),
                            color: const Color(0xffff4980),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: s.h(340.0),
                  ),
                  DefaultDisabledButton(
                    text: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: s.h(19),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
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
