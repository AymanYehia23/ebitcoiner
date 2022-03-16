import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/constants/strings.dart';

class EnterNewPass extends StatelessWidget {
  const EnterNewPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(children: [
      const GradientBackgroundContainer(),
      Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                Strings.signUp,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
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
                  height: s.h(32.0),
                ),
                Text(
                  Strings.enterNewPassword,
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
                    text: 'New Password',
                    isObscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined,
                  ),
                  SizedBox(
                    height:s.h(20.0),
                  ),
                  const DefaultTextField(
                    text: 'Re-type New Password',
                    isObscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined,
                  ),
                  SizedBox(
                    height: s.h(403.0),
                  ),
                  const DefaultDisabledButton(text: Text('Resset Password')),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
