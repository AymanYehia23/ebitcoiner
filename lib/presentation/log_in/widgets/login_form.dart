import 'package:flutter/material.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/extensions/input_validation.dart';

import '../../shared_components/default_textfield.dart';

class LoginForm extends StatefulWidget {
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  IconData iconData = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          DefaultTextField(
            text: 'Email',
            validator: (val) {
              if (!val!.isValidEmail) return 'Enter valid email';
              return null;
            },
            controller: widget._emailController,
          ),
          SizedBox(
            height: s.h(20.0),
          ),
          DefaultTextField(
            text: 'Password',
            isObscureText: _isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                iconData,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  iconData = _isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined;
                });
              },
            ),
            validator: (val) {
              if (!val!.isValidPassword) {
                return 'Enter valid password';
              }
              return null;
            },
            controller: widget._passwordController,
          ),
        ],
      ),
    );
  }
}
