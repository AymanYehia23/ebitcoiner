import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/forget_password/forget_password_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_gradient_button.dart';
import '../widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPasswordScreen> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<ForgetPasswordCubit>()
          .forgetPassword(_emailController.text);
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _formKey = GlobalKey();
    _emailController.addListener(_checkOfEmptyValue);
    context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_emailController.text.isNotEmpty) {
      context.read<ForgetPasswordCubit>().changeIsEmpty(false);
    } else {
      context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              context.read<ForgetPasswordCubit>().email = _emailController.text;
              Navigator.pushReplacementNamed(context, AppRouter.recoveryLink);
            }
            if (state is ForgetPasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email not found!'),
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
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Forget Password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      Strings.forgetMsg,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    ForgetPasswordForm(
                      formKey: _formKey,
                      emailController: _emailController,
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
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
                            text: BlocBuilder<ForgetPasswordCubit,
                                ForgetPasswordState>(
                              builder: (context, state) {
                                if (state is ForgetPasswordLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Text(
                                  'Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                );
                              },
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
      ],
    );
  }
}
