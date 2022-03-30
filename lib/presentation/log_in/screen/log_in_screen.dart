import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_gradient_button.dart';
import '../../sizer/sizer.dart';
import '../widgets/login_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() async {
    _formKey.currentState!.validate();
    if (_formKey.currentState!.validate()) {
      await context.read<LoginCubit>().login(
          email: _emailController.text, password: _passwordController.text);
    }
  }

  @override
  void initState() {
    _emailController.addListener(_checkOfEmptyValue);
    _passwordController.addListener(_checkOfEmptyValue);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<LoginCubit>().isEmpty = false;
    } else {
      context.read<LoginCubit>().isEmpty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccessState) {
              await context.read<LoginCubit>().saveTokens();
              await context.read<AssetsCubit>().getPlanContract();
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
          child: Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.signUp);
                  },
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(17),
                        ),
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
                      height: s.h(24.0),
                    ),
                    Text(
                      Strings.login,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: s.h(30.0),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: s.h(24.0),
                    ),
                    LoginForm(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                    SizedBox(
                      height: s.h(24.0),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRouter.resetPassword);
                      },
                      child: Text(
                        Strings.forgetPassword,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: s.h(15.0),
                              color: const Color(0xffff4980),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: s.h(300.0),
                    ),
                    Builder(
                      builder: (context) {
                        if (context.select((LoginCubit s) => s.isEmpty)) {
                          return DefaultDisabledButton(
                            text: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: s.h(17),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          );
                        } else {
                          return DefaultGradientButton(
                            isFilled: true,
                            text: Builder(
                              builder: (context) {
                                final loginState =
                                    context.watch<LoginCubit>().state;
                                if (loginState is LoginLoadingState) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: s.h(17),
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
                    )
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
