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
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextField(
            text: 'Email',
            validator: (val) {
              if (!val!.isValidEmail) return 'Enter valid email';
              return null;
            },
            controller: _emailController,
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
                  return 'Enter valid password';
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
