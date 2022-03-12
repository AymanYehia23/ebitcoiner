import 'package:flutter/material.dart';
import 'package:hash_store/presentation/Home/screen/home_screen.dart';
import 'package:hash_store/presentation/assets/screen/assets_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../sign_up/screen/sign_up_screen.dart';
import '../splash/screen/splash_screen.dart';

class AppRouter {
  static const String signUp = 'signUp';
  static const String splash = 'splash';
  static const String home = 'home';

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
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
