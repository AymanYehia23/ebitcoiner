import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/extensions/input_validation.dart';
import 'package:hash_store/logic/cubit/forget_password/forget_password_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../shared_components/default_textfield.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm(
      {Key? key, required this.formKey, required this.passwordController})
      : super(key: key);
  final GlobalKey formKey;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: DefaultTextField(
        text: 'Password',
        isObscureText: context.watch<ForgetPasswordCubit>().isObscure,
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
          if (!val!.isValidPassword) {
            return 'Password must contain at least 8 characters\none uppercase letter and one lowercase letter';
          }
          return null;
        },
        controller: passwordController,
      ),
    );
  }
}
