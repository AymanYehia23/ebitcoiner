import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';

import '../../sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
                'Login',
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
              const DefaultTextField(
                text: 'Password',
                wid: 343.0,
              ),
              SizedBox(
                height: s.h(24.0),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget your Password?',
                  style: TextStyle(
                    fontSize: s.h(15.0),
                    color: const Color(0xffff4980),
                  ),
                ),
              ),
              SizedBox(
                height: s.h(300.0),
              ),
              const DefaultDisabledButton(text: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}