import 'package:ebitcoiner/logic/cubit/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
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
        isObscureText: context.watch<ForgetPasswordCubit>().getIsObscure,
        suffixIcon: IconButton(
          icon: Icon(
            context.read<ForgetPasswordCubit>().iconData,
            color: ColorManager.white,
          ),
          onPressed: () {
            context.read<ForgetPasswordCubit>().changePasswordVisibility();
          },
        ),
        validator: (val) {
          if (val!.isEmpty) return 'Enter valid code';
          return null;
        },
        controller: recoveryCodeController,
      ),
    );
  }
}
