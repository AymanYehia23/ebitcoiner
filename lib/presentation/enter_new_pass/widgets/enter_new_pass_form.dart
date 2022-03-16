import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/new_password/new_password_cubit.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/extensions/input_validation.dart';

import '../../shared_components/default_textfield.dart';

class NewPasswordForm extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final GlobalKey<FormState> formKey;
  String? pass;
  NewPasswordForm(
      {Key? key,
      required this.passwordController,
      required this.rePasswordController,
      required this.formKey,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          Builder(
            builder: (context) {
              return DefaultTextField(
                text: 'New Password',
                isObscureText: context.watch<NewPasswordCubit>().isObscure,
                validator: (val) {
                  pass = val;
                  if (!val!.isValidPassword) {
                    return 'Enter valid password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<NewPasswordCubit>().changePasswordVisibility();
                  },
                  icon: Icon(
                    context.watch<NewPasswordCubit>().iconData,
                    color: Colors.white,
                  ),
                ),
                controller: passwordController,
              );
            },
          ),
          SizedBox(
            height: s.h(20.0),
          ),
          Builder(
            builder: (context) {
              return DefaultTextField(
                text: 'Re-type New Password',
                isObscureText: context.watch<NewPasswordCubit>().reIsObscure,
                validator: (val) {
                  if (!val!.isValidPassword) {
                    return 'Enter valid password';
                  } else if (val != pass) {
                    return 'Password does not match';
                  }
                  return null;
                },
                controller: rePasswordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<NewPasswordCubit>()
                        .changeRePasswordVisibility();
                  },
                  icon: Icon(
                    context.watch<NewPasswordCubit>().reIconData,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
