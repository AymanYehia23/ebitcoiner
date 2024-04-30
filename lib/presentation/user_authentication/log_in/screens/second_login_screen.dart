import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/data/models/login_model.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/login/login_cubit.dart';
import '../../../shared_components/loading_dialog.dart';
import '../widgets/second_login_form.dart';
import '../../../shared_components/default_disabled_button.dart';
import '../../../shared_components/default_gradient_button.dart';
import '../../../shared_components/gradient_background_container.dart';

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
            secondLoginRequestModel: SecondLoginRequestModel(
              userName: context.read<LoginCubit>().userName.trim(),
              otp: _otpController.text.trim(),
            ),
          );
    }
  }

  void _resend() async {
    await context.read<LoginCubit>().firstLoginAuth(
          firstLoginRequestModel: FirstLoginRequestModel(
            userName: context.read<LoginCubit>().userName.trim(),
            password: context.read<LoginCubit>().password.trim(),
          ),
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
    context.read<LoginCubit>().setIsObscure = true;
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
            if (state is SecondLoginSuccessState) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(AppRouter.home);
            } else if (state is SecondeLoginLoadingState) {
              loadingDialog(context: context);
            } else if (state is SecondLoginErrorState) {
              Navigator.of(context).pop();
              defaultToast(
                text: state.errorMessage,
                isError: true,
              );
            }
            if (state is FirstLoginSuccessState) {
              Navigator.of(context).pop();
              defaultToast(
                text: 'The OTP has been resent to your email',
              );
            } else if (state is FirstLoginLoadingState) {
              loadingDialog(context: context);
            } else if (state is FirstLoginErrorState) {
              Navigator.of(context).pop();
              defaultToast(
                text: state.errorMessage,
                isError: true,
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
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SecondLoginForm(
                          formKey: _formKey, otpController: _otpController),
                      SizedBox(
                        height: 5.h,
                      ),
                      CircularCountDownTimer(
                        width: 20.w,
                        height: 20.h,
                        ringColor: ColorManager.lightGray,
                        fillColor: ColorManager.secondary,
                        backgroundColor: ColorManager.transparent,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 10.0,
                        textFormat: CountdownTextFormat.S,
                        textStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12.sp,
                                      ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _resend();
                                    _counterController.restart(
                                        duration: _duration);
                                  },
                                  child: Text(
                                    'Resend',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 12.sp,
                                          color: ColorManager.secondary,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
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
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
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
