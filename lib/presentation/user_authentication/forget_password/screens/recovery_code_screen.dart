import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/logic/cubit/forget_password/forget_password_cubit.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/loading_dialog.dart';
import '../../forget_password/widgets/recovery_code_form.dart';
import '../../../router/app_router.dart';
import '../../../shared_components/default_disabled_button.dart';
import '../../../shared_components/default_gradient_button.dart';

class RecoveryCodeScreen extends StatefulWidget {
  const RecoveryCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RecoveryCodeScreen> createState() => _RecoveryCodeScreenState();
}

class _RecoveryCodeScreenState extends State<RecoveryCodeScreen> {
  late final TextEditingController _codeController;
  late final GlobalKey<FormState> _formKey;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<ForgetPasswordCubit>()
          .verifyCode(_codeController.text.trim());
    }
  }

  void _checkOfEmptyValue() {
    if (_codeController.text.isNotEmpty) {
      context.read<ForgetPasswordCubit>().changeIsEmpty(false);
    } else {
      context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    }
  }

  @override
  void initState() {
    _codeController = TextEditingController();
    _formKey = GlobalKey();
    _codeController.addListener(_checkOfEmptyValue);
    context.read<ForgetPasswordCubit>().changeIsEmpty(true);
    context.read<ForgetPasswordCubit>().setIsObscure = true;
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    final _forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccessState) {
              Navigator.of(context).pop();
              context.read<ForgetPasswordCubit>().recoveryCode =
                  _codeController.text;
              Navigator.pushReplacementNamed(context, AppRouter.resetPassword);
            } else if (state is VerifyCodeLoadingState) {
              loadingDialog(context: context);
            } else if (state is VerifyCodeErrorState) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25.w,
                            width: 25.w,
                            child: SvgPicture.asset(
                              Strings.msgImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Recovery code sent!',
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
                        'We’ve sent the password recovery code to your email "${_forgetPasswordCubit.email.trim()}"',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      RecoveryCodeForm(
                        formKey: _formKey,
                        recoveryCodeController: _codeController,
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
