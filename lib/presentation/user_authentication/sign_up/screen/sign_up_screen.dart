import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/data/models/sign_up_model.dart';
import 'package:ebitcoiner/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';
import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_components/default_disabled_button.dart';
import '../../../shared_components/loading_dialog.dart';
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
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _countryCode;

  @override
  void initState() {
    _userNameController.addListener(_checkOfEmptyValue);
    _emailController.addListener(_checkOfEmptyValue);
    _phoneNumberController.addListener(_checkOfEmptyValue);
    _passwordController.addListener(_checkOfEmptyValue);
    context.read<SignUpCubit>().changeIsEmpty(true);
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_userNameController.text.isNotEmpty &&
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
        userName: _userNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        phone: '$_countryCode${_phoneNumberController.text}'.trim(),
      );
      await context.read<SignUpCubit>().signUp(signUPRequestModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        MultiBlocListener(
          listeners: [
            BlocListener<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  Navigator.of(context).pop();
                  defaultToast(text: 'Account successfully created');
                  Navigator.of(context)
                      .pushReplacementNamed(AppRouter.firstLogin);
                } else if (state is SignUpLoadingState) {
                  loadingDialog(context: context);
                } else if (state is SignUpErrorState) {
                  Navigator.of(context).pop();
                  defaultToast(
                    text: state.errorMessage,
                    isError: true,
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
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.firstLogin);
                  },
                  child: Text(
                    'Login',
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
                        'Create New Account',
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
                        nameController: _userNameController,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    color: ColorManager.secondary,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 11.sp,
                                    color: ColorManager.secondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
                              text: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onPressed: () {
                                _countryCode =
                                    context.read<SignUpCubit>().countryCode;
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
