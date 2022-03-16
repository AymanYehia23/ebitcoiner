import 'package:flutter/material.dart';
import 'package:hash_store/presentation/shared_components/default_disabled_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';

import '../../../core/constants/strings.dart';
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

  bool _isEmpty = true;

  void _submit() {
    _formKey.currentState!.validate();
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
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
      setState(() {
        _isEmpty = false;
      });
    } else {
      setState(() {
        _isEmpty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.signUp);
                },
                child: Text(
                  Strings.signUp,
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
                    onPressed: () {},
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
                  _isEmpty
                      ? DefaultDisabledButton(
                          text: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: s.h(17),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      : DefaultGradientButton(
                          isFilled: true,
                          text: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: s.h(17),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          onPressed: () {
                            _submit();
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
