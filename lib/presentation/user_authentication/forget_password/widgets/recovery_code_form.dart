import 'package:flutter/material.dart';

import '../../../shared_components/default_textfield.dart';

class RecoveryCodeForm extends StatelessWidget {
  const RecoveryCodeForm(
      {Key? key, required this.formKey, required this.recoveryCodeController})
      : super(key: key);
  final GlobalKey formKey;
  final TextEditingController recoveryCodeController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: DefaultTextField(
        text: 'Enter the code',
        validator: (val) {
          if (val!.isEmpty) return 'Enter valid code';
          return null;
        },
        controller: recoveryCodeController,
      ),
    );
  }
}
