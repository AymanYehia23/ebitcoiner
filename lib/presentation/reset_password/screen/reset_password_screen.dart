import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/default_textfield.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';
import 'package:hash_store/core/extensions/input_validation.dart';

import '../../../logic/cubit/update_password/update_password_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_gradient_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit() {
    _formKey.currentState!.validate();
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRouter.recoveryLink);
    }
  }

  @override
  void initState() {
    context.read<UpdatePasswordCubit>().isEmpty = true;
    _emailController.addListener(_checkOfEmptyValue);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _checkOfEmptyValue() {
    if (_emailController.text.isNotEmpty) {
      context.read<UpdatePasswordCubit>().isEmpty = false;
    } else {
      context.read<UpdatePasswordCubit>().isEmpty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: s.h(16.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  Text(
                    Strings.resetPassword,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: s.h(30.0),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: s.h(8.0),
                  ),
                  Text(
                    Strings.resetMsg,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: s.h(16.0),
                        ),
                  ),
                  SizedBox(
                    height: s.h(24.0),
                  ),
                  Form(
                    key: _formKey,
                    child: DefaultTextField(
                      text: 'Email',
                      validator: (val) {
                        if (!val!.isValidEmail) return 'Enter valid email';
                        return null;
                      },
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(
                    height: s.h(435.0),
                  ),
                  Builder(
                    builder: (context) {
                      if (context
                          .select((UpdatePasswordCubit u) => u.isEmpty)) {
                        return DefaultDisabledButton(
                          text: Text(
                            'Next',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: s.h(19),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        );
                      } else {
                        return DefaultGradientButton(
                          isFilled: true,
                          text: Text(
                            'Next',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(19),
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
      ],
    );
  }
}
