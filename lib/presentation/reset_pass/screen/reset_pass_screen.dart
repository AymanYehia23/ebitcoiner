import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

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
              horizontal: s.h(16.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  Text(
                    Strings.resetPassword,
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
                    Strings.resetMsg,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(16.0),
                        ),
                  ),
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  DefaultTextField(
                    text: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: s.h(435.0),
                  ),
                  DefaultDisabledButton(
                    text: Text(
                      'Next',
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
