import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/extensions/input_validation.dart';
import '../../../logic/cubit/sign_up/sign_up_cubit.dart';
import '../../shared_components/default_textfield.dart';
import 'country_code_widget.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneNumberController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _phoneNumberController = phoneNumberController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextField(
            text: 'Name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z]+|\s"),
              )
            ],
            validator: (val) {
              if (!val!.isValidName) return 'Enter valid name';
              return null;
            },
            controller: _nameController,
          ),
          SizedBox(
            height: s.h(20.0),
          ),
          DefaultTextField(
            text: 'Email',
            validator: (val) {
              if (!val!.isValidEmail) return 'Enter valid email';
              return null;
            },
            controller: _emailController,
          ),
          SizedBox(
            height: s.h(20.0),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomCountryCode(),
              ),
              SizedBox(
                width: s.w(16),
              ),
              Expanded(
                flex: 2,
                child: DefaultTextField(
                  text: 'Phone Number',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isValidPhone) return 'Enter valid phone';
                    return null;
                  },
                  controller: _phoneNumberController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: s.h(20.0),
          ),
          Builder(
            builder: (context) {
              return DefaultTextField(
                text: 'Password',
                isObscureText: context.watch<SignUpCubit>().isObscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    context.read<SignUpCubit>().iconData,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<SignUpCubit>().changePasswordVisibility();
                  },
                ),
                validator: (val) {
                  if (!val!.isValidPassword) return 'Enter valid password';
                  return null;
                },
                controller: _passwordController,
              );
            }
          )
        ],
      ),
    );
  }
}
