import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/logic/cubit/forget_password/forget_password_cubit.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../router/app_router.dart';
import '../../../shared_components/default_disabled_button.dart';
import '../../../shared_components/default_gradient_button.dart';
import '../../../shared_components/loading_dialog.dart';
import '../widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<ForgetPasswordCubit>()
          .resetPassword(_passwordController.text.trim());
    }
  }

  void _checkOfEmptyValue() {
    if (_passwordController.text.isNotEmpty) {
      context.read<ForgetPasswordCubit>().changeIsEmpty(false);
    } else {
      context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    }
  }

  @override
  void initState() {
    _passwordController = TextEditingController();
    _formKey = GlobalKey();
    _passwordController.addListener(_checkOfEmptyValue);
    context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    context.read<ForgetPasswordCubit>().setIsObscure = true;
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              Navigator.of(context).pop();
              defaultToast(
                text:
                    'The password has been changed successfully, you can login now',
              );
              Navigator.pushReplacementNamed(context, AppRouter.firstLogin);
            } else if (state is ResetPasswordLoadingState) {
              loadingDialog(context: context);
            } else if (state is ResetPasswordErrorState) {
              Navigator.of(context).pop();
              defaultToast(
                text: state.errorMessage,
                isError: true,
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.firstLogin);
                  },
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                        ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: _height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Enter new password',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ResetPasswordForm(
                        formKey: _formKey,
                        passwordController: _passwordController,
                      ),
                      const Spacer(),
                      Builder(
                        builder: (context) {
                          if (context
                              .select((ForgetPasswordCubit f) => f.isEmpty)) {
                            return DefaultDisabledButton(
                              text: Text(
                                'Next',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            );
                          } else {
                            return DefaultGradientButton(
                              isFilled: true,
                              text: Text(
                                'Next',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14.sp,
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
          ),
        ),
      ],
    );
  }
}
