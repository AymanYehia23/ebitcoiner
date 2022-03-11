import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../sign_up/screen/sign_up_screen.dart';
import '../splash/screen/splash_screen.dart';

class AppRouter {
  static const String signUp = 'signUp';
  static const String splash = 'splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(
            title: Strings.signUpScreenTitle,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
