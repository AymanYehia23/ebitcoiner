import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.h(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: s.h(112.0),
              ),
              Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: s.h(30.0)),
              ),
              SizedBox(
                height: s.h(8.0),
              ),
              Text(
                'Enter your account email to send you password recovery link',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: s.h(16.0)),
              ),
              SizedBox(
                height: s.h(24.0),
              ),
              const DefaultTextField(
                text: 'Email',
                wid: 343.0,
              ),
              SizedBox(
                height: s.h(435.0),
              ),
            const DefaultDisabledButton(text: Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
