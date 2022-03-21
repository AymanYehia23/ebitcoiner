import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/constants/strings.dart';

import '../../../logic/cubit/update_password/update_password_cubit.dart';
import '../../shared_components/default_gradient_button.dart';
import '../widgets/enter_new_pass_form.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({Key? key}) : super(key: key);

  @override
  State<EnterNewPassword> createState() => _EnterNewPassState();
}

class _EnterNewPassState extends State<EnterNewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<UpdatePasswordCubit>()
          .updatePassword(_passwordController.text, _rePasswordController.text);
    }
  }

  @override
  void initState() {
    context.read<UpdatePasswordCubit>().isEmpty = true;

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
      context.read<UpdatePasswordCubit>().isEmpty = false;
    } else {
      context.read<UpdatePasswordCubit>().isEmpty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(children: [
      const GradientBackgroundContainer(),
      BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
        listener: (context, state) {
          if (state is UpdatePasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password changed successfully'),
                duration: Duration(seconds: 3),
              ),
            );
            Navigator.of(context).pushReplacementNamed(AppRouter.logIn);
          }
          if(state is UpdatePasswordErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to change password'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: Scaffold(
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
                      if (context
                          .select((UpdatePasswordCubit u) => u.isEmpty)) {
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
                          text: Builder(builder: (context) {
                            final updatePasswordState =
                                context.watch<UpdatePasswordCubit>().state;
                            if (updatePasswordState
                                is UpdatePasswordLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Text(
                              'Reset Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: s.h(19),
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          }),
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
      ),
    ]);
  }
}
