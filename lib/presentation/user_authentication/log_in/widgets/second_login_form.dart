import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../logic/cubit/login/login_cubit.dart';
import '../../../shared_components/default_textfield.dart';

class SecondLoginForm extends StatelessWidget {
  const SecondLoginForm({
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
        isObscureText: context.watch<LoginCubit>().getIsObscure,
        suffixIcon: IconButton(
          icon: Icon(
            context.read<LoginCubit>().iconData,
            color: ColorManager.white,
          ),
          onPressed: () {
            context.read<LoginCubit>().changePasswordVisibility();
          },
        ),
        validator: (val) {
          if (!val!.isNotEmpty) return 'Enter valid OTP';
          return null;
        },
        controller: _otpController,
      ),
    );
  }
}
