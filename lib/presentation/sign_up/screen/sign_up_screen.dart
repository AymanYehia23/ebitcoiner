import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

import '../../shared_components/default_disabled_button.dart';
import '../../shared_components/default_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, }) : super(key: key);

  

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
                height: s.h(112.0),
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
                wid: 343.0,
              ),
              SizedBox(
                height: s.h(20.0),
              ),
              SizedBox(
                height: s.h(56.0),
                child: Row(
                  children: [
                    const DefaultTextField(
                      text: '+20',
                      wid: 104.0,
                    ),
                    SizedBox(
                      width: s.w(16.0),
                    ),
                    const DefaultTextField(
                      text: 'Phone Number',
                      wid: 224.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: s.h(20.0),
              ),
              const DefaultTextField(
                text: 'Password',
                wid: 343.0,
              ),
              SizedBox(
                height: s.h(24.0),
              ),
              Text(
                'By continuing to register, you agree to',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: s.h(30.0)),
              ),
              SizedBox(
                height: s.h(240.0),
              ),
              const DefaultDisabledButton(text: Text('Sign Up')),
            ],
          ),
        ),
     ),
    );
  }
}
