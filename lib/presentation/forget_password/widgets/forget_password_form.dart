import 'package:flutter/material.dart';
import 'package:hash_store/core/extensions/input_validation.dart';

import '../../shared_components/default_textfield.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm(
      {Key? key, required this.formKey, required this.emailController})
      : super(key: key);
  final GlobalKey formKey;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: DefaultTextField(
        text: 'Email',
        validator: (val) {
          if (!val!.isValidEmail) return 'Enter valid email';
          return null;
        },
        controller: emailController,
      ),
    );
  }
}
