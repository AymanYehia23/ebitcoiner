import 'package:flutter/material.dart';
import 'package:ebitcoiner/presentation/onboarding/screen/onboarding_screen.dart';

import '../../core/exceptions/route_exception.dart';

import '../devices/add_mining_device/screens/add_mining_device_screen.dart';
import '../hashrate/add_plan/screen/add_plan_screen.dart';
import '../home/home_screen.dart';
import '../user_authentication/forget_password/screens/forget_password_screen.dart';
import '../user_authentication/forget_password/screens/recovery_code_screen.dart';
import '../user_authentication/forget_password/screens/reset_password_screen.dart';
import '../user_authentication/log_in/screens/first_login_screen.dart';
import '../user_authentication/log_in/screens/second_login_screen.dart';
import '../user_authentication/sign_up/screen/sign_up_screen.dart';
import '../wallet/deposit/screen/deposit_screen.dart';
import '../wallet/withdraw/screen/withdraw_currency_screen.dart';
import '../wallet/withdraw/screen/withdraw_screen.dart';

class AppRouter {
  static const String signUp = 'signUp';
  static const String onboarding = 'onboarding';
  static const String firstLogin = 'firstLogin';
  static const String secondLogin = 'secondLogin';
  static const String forgetPassword = 'forgetPassword';
  static const String home = 'home';
  static const String recoveryLink = 'recoveryLink';
  static const String resetPassword = 'resetPassword';
  static const String addPlanContract = 'addPlanContract';
  static const String buyMiningDevice = 'buyMiningDevice';
  static const String withdraw = 'withdraw';
  static const String withdrawCurrency = 'withdrawCurrency';
  static const String deposit = 'deposit';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case firstLogin:
        return MaterialPageRoute(builder: (_) => const FirstLogInScreen());
      case secondLogin:
        return MaterialPageRoute(builder: (_) => const SecondLoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case recoveryLink:
        return MaterialPageRoute(builder: (_) => const RecoveryCodeScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case addPlanContract:
        return MaterialPageRoute(
            builder: (_) => const ChooseDesiredPlanScreen());
      case buyMiningDevice:
        return MaterialPageRoute(builder: (_) => const BuyMiningDeviceScreen());
      case withdraw:
        return MaterialPageRoute(builder: (_) => const WithdrawScreen());
      case withdrawCurrency:
        return MaterialPageRoute(
            builder: (_) => const WithdrawCurrencyScreen());
      case deposit:
        return MaterialPageRoute(builder: (_) => const DepositScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
