import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/extensions/input_validation.dart';

import '../../../logic/cubit/update_password/update_password_cubit.dart';
import '../../shared_components/default_textfield.dart';

class NewPasswordForm extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final GlobalKey<FormState> formKey;
  String? pass;
  NewPasswordForm({
    Key? key,
    required this.passwordController,
    required this.rePasswordController,
    required this.formKey,
  }) : super(key: key);
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
                isObscureText: context.watch<UpdatePasswordCubit>().isObscure,
                validator: (val) {
                  pass = val;
                  if (!val!.isValidPassword) {
                    return 'Enter valid password';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<UpdatePasswordCubit>().changePasswordVisibility();
                  },
                  icon: Icon(
                    context.read<UpdatePasswordCubit>().iconData,
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
                isObscureText: context.watch<UpdatePasswordCubit>().isObscure2,
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
                    context.read<UpdatePasswordCubit>().changePasswordVisibility2();
                  },
                  icon: Icon(
                    context.read<UpdatePasswordCubit>().iconData2,
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
