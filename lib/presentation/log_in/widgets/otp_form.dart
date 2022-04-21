import 'package:flutter/material.dart';
import '../../shared_components/default_textfield.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController otpController,
  })  : _formKey = formKey,
        _otpController = otpController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _otpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DefaultTextField(
        text: 'Enter OTP',
        validator: (val) {
          if (!val!.isNotEmpty) return 'Enter valid OTP';
          return null;
        },
        controller: _otpController,
      ),
    );
  }
}