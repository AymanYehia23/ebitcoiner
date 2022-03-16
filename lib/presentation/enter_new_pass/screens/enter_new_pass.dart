import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/new_password/new_password_cubit.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/constants/strings.dart';

import '../../shared_components/default_gradient_button.dart';
import '../widgets/enter_new_pass_form.dart';

class EnterNewPass extends StatefulWidget {
  const EnterNewPass({Key? key}) : super(key: key);

  @override
  State<EnterNewPass> createState() => _EnterNewPassState();
}

class _EnterNewPassState extends State<EnterNewPass> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRouter.logIn);
    }
  }

  @override
  void initState() {
    _passwordController.addListener(_checkOfEmptyValue);
    _rePasswordController.addListener(_checkOfEmptyValue);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_passwordController.text.isNotEmpty &&
        _rePasswordController.text.isNotEmpty) {
      context.read<NewPasswordCubit>().isEmpty = false;
    } else {
      context.read<NewPasswordCubit>().isEmpty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(children: [
      const GradientBackgroundContainer(),
      Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRouter.signUp);
              },
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: s.w(16.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: s.h(32.0),
                ),
                Text(
                  Strings.enterNewPassword,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: s.h(30.0),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: s.h(24.0),
                ),
                NewPasswordForm(
                  passwordController: _passwordController,
                  rePasswordController: _rePasswordController,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: s.h(403.0),
                ),
                Builder(
                  builder: (context) {
                    if (context.select((NewPasswordCubit n) => n.isEmpty)) {
                      return DefaultDisabledButton(
                        text: Text(
                          'Reset Password',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: s.h(19),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      );
                    } else {
                      return DefaultGradientButton(
                        isFilled: true,
                        text: Text(
                          'Reset Password',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: s.h(19),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () {
                          _submit();
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
