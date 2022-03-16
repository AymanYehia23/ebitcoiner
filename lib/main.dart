import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/data/data_providers/sign_up_api.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:hash_store/logic/cubit/new_password/new_password_cubit.dart';
import 'package:hash_store/logic/cubit/reset_password/reset_password_cubit.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/http/http_service.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

void main() {
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(signUpRepo: SignUpAPI()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
        ),
        BlocProvider<NewPasswordCubit>(
          create: (context) => NewPasswordCubit(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
