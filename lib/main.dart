// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/data_providers/asic_contract_api.dart';
import 'package:hash_store/data/data_providers/delete_account_api.dart';
import 'package:hash_store/data/data_providers/deposit_api.dart';
import 'package:hash_store/data/data_providers/get_user_data_api.dart';
import 'package:hash_store/data/data_providers/login_api.dart';
import 'package:hash_store/data/data_providers/logout_api.dart';
import 'package:hash_store/data/data_providers/sign_up_api.dart';
import 'package:hash_store/data/data_providers/forget_password_api.dart';
import 'package:hash_store/data/data_providers/update_password_api.dart';
import 'package:hash_store/data/data_providers/withdraw_api.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/logic/cubit/deposit/deposit_cubit.dart';
import 'package:hash_store/logic/cubit/forget_password/forget_password_cubit.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:hash_store/logic/cubit/withdraw/withdraw_cubit.dart';
import 'package:hash_store/data/data_providers/currency_converter_api.dart';
import 'package:hash_store/presentation/auth_dialog/auth_dialog.dart';
import 'package:hash_store/presentation/onboarding/screen/onboarding_screen.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/data_providers/asics_api.dart';
import 'data/data_providers/plan_contract_api.dart';
import 'data/data_providers/plans_api.dart';
import 'data/http/http_service.dart';
import 'data/models/plan_model.dart';
import 'logic/cubit/asic_contract/asic_contract_cubit.dart';
import 'logic/cubit/assets/assets_cubit.dart';
import 'logic/cubit/devices/devices_cubit.dart';
import 'logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'logic/cubit/plan_contract/plan_contract_cubit.dart';
import 'logic/cubit/profile/profile_cubit.dart';
import 'logic/cubit/wallet/wallet_cubit.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/router/app_router.dart';
import 'presentation/shared_components/loading_widget.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpService.init();
  BlocOverrides.runZoned(
    () {
      runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => const MyApp(),
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(SignUpAPI()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            LoginApi(),
            LoginResponseModel(),
            SecureStorage(),
          )..tryAutoLogin(),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (context) =>
              ForgetPasswordCubit(ForgetPasswordApi(), SecureStorage()),
        ),
        BlocProvider<AssetsCubit>(
          create: (context) => AssetsCubit(
            PlanContractApi(),
            UserDataApi(),
            User(balance: Balance()),
            CurrencyConverter(),
          ),
        ),
        BlocProvider<HashRateCubit>(
          create: (context) => HashRateCubit(PlanContractApi()),
        ),
        BlocProvider<DevicesCubit>(
          create: (context) => DevicesCubit(AsicContractApi()),
        ),
        BlocProvider<WalletCubit>(
          create: (context) => WalletCubit(DepositApi(), WithdrawApi()),
        ),
        BlocProvider<PlanContractCubit>(
          create: (context) => PlanContractCubit(
            PlansApi(),
            PlanContractApi(),
            PlansResponseModel(plans: [], plansHashPower: []),
          ),
        ),
        BlocProvider<AsicContractCubit>(
          create: (context) => AsicContractCubit(AsicsApi(), AsicContractApi()),
        ),
        BlocProvider<WithdrawCubit>(
          create: (context) => WithdrawCubit(
            UserDataApi(),
            User(
              balance: Balance(),
            ),
            WithdrawApi(),
          ),
        ),
        BlocProvider<DepositCubit>(
          create: (context) => DepositCubit(DepositApi()),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(
            DeleteAccountApi(),
            UpdatePasswordApi(),
            LogoutApi(),
            SecureStorage(),
          ),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: Strings.appTitle,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is AutoLoginSuccessState) {
                  FlutterNativeSplash.remove();
                  return HomeScreen();
                } else if (state is AutoLoginFailedState) {
                  FlutterNativeSplash.remove();
                  return OnboardingScreen();
                } else if (state is AuthErrorState) {
                  FlutterNativeSplash.remove();
                  return AuthDialog();
                } else if (state is AutoLoginLoadingState) {
                  return LoadingWidget();
                }
                else{
                  FlutterNativeSplash.remove();
                  return OnboardingScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
