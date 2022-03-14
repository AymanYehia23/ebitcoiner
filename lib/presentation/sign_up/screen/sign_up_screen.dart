import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../shared_components/default_disabled_button.dart';
import '../../shared_components/default_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

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
                  'Login',
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
                    'Create New Account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: s.h(30.0)),
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
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: DefaultTextField(
                          text: '+20',
                        ),
                      ),
                      SizedBox(
                        width: s.w(16),
                      ),
                      const Expanded(
                        flex: 2,
                        child: DefaultTextField(
                          text: 'Phone Number',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.h(20.0),
                  ),
                  const DefaultTextField(
                    text: 'Password',
                  ),
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  Text(
                    'By continuing to register, you agree to',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: s.h(15.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Terms & Conditions',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(15.0),
                                    color: const Color(0xffff4980),
                                  ),
                        ),
                      ),
                      Text(
                        ' and ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: s.h(15.0),
                            ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Privacy Policy',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(15.0),
                                    color: const Color(0xffff4980),
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.h(240.0),
                  ),
                  DefaultDisabledButton(
                      text: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(17),
                          fontWeight: FontWeight.bold,
                        ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
