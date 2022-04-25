import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/presentation/log_in/widgets/otp_form.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/cubit/login/login_cubit.dart';
import '../../shared_components/default_disabled_button.dart';
import '../../shared_components/default_gradient_button.dart';
import '../../shared_components/gradient_background_container.dart';

class SecondLoginScreen extends StatefulWidget {
  const SecondLoginScreen({Key? key}) : super(key: key);

  @override
  State<SecondLoginScreen> createState() => _SecondLoginScreenState();
}

class _SecondLoginScreenState extends State<SecondLoginScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _otpController;
  late final CountDownController _counterController;
  final int _duration = 30;
  bool isTimeEnded = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<LoginCubit>().secondeLoginAuth(
            userName: context.read<LoginCubit>().userName,
            otp: _otpController.text,
          );
    }
  }

  void _resend() async {
    await context.read<LoginCubit>().firstLoginAuth(
          userName: context.read<LoginCubit>().userName,
          password: context.read<LoginCubit>().password,
        );
    setState(() {
      isTimeEnded = false;
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey();
    _otpController = TextEditingController();
    _counterController = CountDownController();
    _otpController.addListener(_checkOfEmptyValue);
    context.read<LoginCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_otpController.text.isNotEmpty) {
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
            if (state is SecondeLoginSuccessState) {
              await context.read<LoginCubit>().saveTokens();
              Navigator.of(context).pushReplacementNamed(AppRouter.home);
            }
            if (state is SecondeLoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wrong OTP'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
            if (state is FirstLoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The OTP has been resent to your email'),
                  duration: Duration(seconds: 3),
                ),
              );
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
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRouter.firstLogin);
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
                      OtpForm(formKey: _formKey, otpController: _otpController),
                      SizedBox(
                        height: 5.h,
                      ),
                      CircularCountDownTimer(
                        width: 20.w,
                        height: 20.h,
                        ringColor: Colors.grey[300]!,
                        fillColor: const Color(0xffff4980),
                        backgroundColor: Colors.transparent,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 10.0,
                        textFormat: CountdownTextFormat.S,
                        textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                        duration: _duration,
                        initialDuration: 0,
                        isReverse: true,
                        isReverseAnimation: true,
                        controller: _counterController,
                        onComplete: () {
                          setState(() {
                            isTimeEnded = true;
                          });
                        },
                      ),
                      isTimeEnded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'OTP Expired!',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 12.sp,
                                      ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _resend();
                                    _counterController.restart(duration: _duration);
                                  },
                                  child: Text(
                                    'Resend',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12.sp,
                                          color: const Color(0xffff4980),
                                        ),
                                  ),
                                ),
                              ],
                            )
                          : const Text(''),
                     const Spacer(),
                      Builder(
                        builder: (context) {
                          if (context.select((LoginCubit s) => s.isEmpty)) {
                            return DefaultDisabledButton(
                              text: Text(
                                'Login',
                                style:
                                    Theme.of(context).textTheme.bodyText2!.copyWith(
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
                                  if (state is SecondeLoginLoadingState) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Text(
                                      'Login',
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
        ),
      ],
    );
  }
}
