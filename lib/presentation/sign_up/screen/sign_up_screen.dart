import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/login/login_cubit.dart';
import '../../shared_components/default_disabled_button.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _countryCode;

  @override
  void initState() {
    _nameController.addListener(_checkOfEmptyValue);
    _emailController.addListener(_checkOfEmptyValue);
    _phoneNumberController.addListener(_checkOfEmptyValue);
    _passwordController.addListener(_checkOfEmptyValue);
    context.read<SignUpCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<SignUpCubit>().changeIsEmpty(false);
    } else {
      context.read<SignUpCubit>().changeIsEmpty(true);
    }
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final signUPRequestModel = SignUPRequestModel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phone: '$_countryCode${_phoneNumberController.text}',
      );
      await Hive.openBox('userData');

      await context.read<SignUpCubit>().signUp(signUPRequestModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        MultiBlocListener(
          listeners: [
            BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) async {
                if (state is SignUpErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                } else if (state is SignUpSuccessState) {
                  await context.read<LoginCubit>().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                  await context.read<LoginCubit>().saveTokens();
                }
              },
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Navigator.of(context).pushReplacementNamed(AppRouter.home);
                } else if (state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to login'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRouter.logIn);
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                        ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      Strings.createNewAccount,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 22.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SignUpForm(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      phoneNumberController: _phoneNumberController,
                      passwordController: _passwordController,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'By continuing to register, you agree to',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 11.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Terms & Conditions',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      color: const Color(0xffff4980),
                                    ),
                          ),
                        ),
                        Text(
                          ' and ',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 11.sp,
                                  ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      color: const Color(0xffff4980),
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Builder(
                      builder: (context) {
                        if (context.select((SignUpCubit s) => s.isEmpty)) {
                          return DefaultDisabledButton(
                            text: Text(
                              'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          );
                        } else {
                          return DefaultGradientButton(
                            isFilled: true,
                            text: Builder(builder: (context) {
                              final signUpState =
                                  context.watch<SignUpCubit>().state;
                              final loginState =
                                  context.watch<LoginCubit>().state;
                              if (signUpState is SignUpLoadingState ||
                                  loginState is LoginLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            }),
                            onPressed: () {
                              _countryCode =
                                  context.read<SignUpCubit>().countryCode;
                              _submit();
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
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
