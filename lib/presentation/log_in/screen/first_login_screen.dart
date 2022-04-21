import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_gradient_button.dart';
import '../widgets/login_form.dart';

class FirstLogInScreen extends StatefulWidget {
  const FirstLogInScreen({Key? key}) : super(key: key);

  @override
  State<FirstLogInScreen> createState() => _FirstLogInScreenState();
}

class _FirstLogInScreenState extends State<FirstLogInScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<LoginCubit>().firstLoginAuth(
            userName: _userNameController.text,
            password: _passwordController.text,
          );
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController.addListener(_checkOfEmptyValue);
    _passwordController.addListener(_checkOfEmptyValue);
    context.read<LoginCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_userNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<LoginCubit>().changeIsEmpty(false);
    } else {
      context.read<LoginCubit>().changeIsEmpty(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is FirstLoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The OTP has been sent to your email'),
                  duration: Duration(seconds: 3),
                ),
              );
              context.read<LoginCubit>().userName = _userNameController.text;
              context.read<LoginCubit>().password = _passwordController.text;
              Navigator.of(context).pushReplacementNamed(AppRouter.secondLogin);
            }
            if (state is FirstLoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invalid username or password'),
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
                    Navigator.pushReplacementNamed(context, AppRouter.signUp);
                  },
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                        ),
                  ),
                ),
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
                      Strings.login,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    LoginForm(
                      formKey: _formKey,
                      userNameController: _userNameController,
                      passwordController: _passwordController,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRouter.forgetPassword);
                      },
                      child: Text(
                        Strings.forgetPassword,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11.sp,
                              color: const Color(0xffff4980),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Builder(
                      builder: (context) {
                        if (context.select((LoginCubit s) => s.isEmpty)) {
                          return DefaultDisabledButton(
                            text: Text(
                              'Send OTP',
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
                            text: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is FirstLoginLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Text(
                                    'Send OTP',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  );
                                }
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
