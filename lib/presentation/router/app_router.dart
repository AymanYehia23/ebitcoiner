import 'package:flutter/material.dart';
import 'package:hash_store/presentation/Home/screen/home_screen.dart';
import 'package:hash_store/presentation/log_in/screen/log_in_screen.dart';
import 'package:hash_store/presentation/recovery_link/screens/recovery_link_screen.dart';
import '../../core/exceptions/route_exception.dart';
import '../enter_new_password/screens/enter_new_password.dart';
import '../reset_password/screen/reset_password_screen.dart';
import '../sign_up/screen/sign_up_screen.dart';
import '../splash/screen/splash_screen.dart';

class AppRouter {
  static const String signUp = 'signUp';
  static const String splash = 'splash';
  static const String logIn = 'logIn';
  static const String resetPassword = 'resetPassword';
  static const String home = 'home';
  static const String recoveryLink = 'recoveryLink';
  static const String enterNewPassword = 'enterNewPassword';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case logIn:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case recoveryLink:
        return MaterialPageRoute(builder: (_) => const RecoveryLinkScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case enterNewPassword:
        return MaterialPageRoute(builder: (_) => const EnterNewPassword());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
