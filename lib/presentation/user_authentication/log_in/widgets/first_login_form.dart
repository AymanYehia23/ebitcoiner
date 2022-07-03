import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/logic/cubit/login/login_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/default_textfield.dart';

class FirstLoginForm extends StatelessWidget {
  const FirstLoginForm({
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
              if (val!.isEmpty) return 'Enter valid user name';
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
                if (val!.isEmpty) {
                  return 'Enter valid Password';
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
