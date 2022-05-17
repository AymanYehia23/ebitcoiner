import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_toast.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/login/login_cubit.dart';
import '../../../../main.dart';
import '../../../router/app_router.dart';
import '../../../shared_components/default_gradient_button.dart';
import '../../../shared_components/loading_widget.dart';
import '../widgets/first_login_form.dart';

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
            firstLoginRequestModel: FirstLoginRequestModel(
              userName: _userNameController.text.trim(),
              password: _passwordController.text.trim(),
            ),
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
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is FirstLoginSuccessState) {
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
              defaultToast(
                text: 'The OTP has been sent to your email',
              );
              context.read<LoginCubit>().userName = _userNameController.text;
              context.read<LoginCubit>().password = _passwordController.text;
              Navigator.of(context).pushReplacementNamed(AppRouter.secondLogin);
            } else if (state is FirstLoginLoadingState) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () => Future.value(false),
                    child: const Dialog(
                      child: LoadingWidget(),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
              );
            } else if (state is FirstLoginErrorState) {
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
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
                        .pushReplacementNamed(AppRouter.signUp);
                  },
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                        ),
                  ),
                ),
              ],
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(AppRouter.onboarding);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: _height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      FirstLoginForm(
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
                          'Forget your Password',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 11.sp,
                                    color: const Color(0xffff4980),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const Spacer(),
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
                              text: Text(
                                'Send OTP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 13.sp,
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
