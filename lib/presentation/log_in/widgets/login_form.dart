import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:hash_store/core/extensions/input_validation.dart';
import 'package:sizer/sizer.dart';

import '../../shared_components/default_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _userNameController = userNameController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _userNameController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextField(
            text: 'User name',
            validator: (val) {
              if (val!.isEmpty) return 'Enter valid User name';
              return null;
            },
            controller: _userNameController,
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Builder(builder: (context) {
            return DefaultTextField(
              text: 'Password',
              isObscureText: context.watch<LoginCubit>().isObscure,
              suffixIcon: IconButton(
                icon: Icon(
                  context.read<LoginCubit>().iconData,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<LoginCubit>().changePasswordVisibility();
                },
              ),
              validator: (val) {
                if (!val!.isValidPassword) {
                  return 'Password must contain at least 8 characters\none uppercase letter and one lowercase letter';
                }
                return null;
              },
              controller: _passwordController,
            );
          }),
        ],
      ),
    );
  }
}
