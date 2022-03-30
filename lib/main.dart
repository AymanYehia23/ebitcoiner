import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/constants/enums.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/data_providers/login_api.dart';
import 'package:hash_store/data/data_providers/plan_contract_api.dart';
import 'package:hash_store/data/data_providers/sign_up_api.dart';
import 'package:hash_store/data/data_providers/update_password_api.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/models/plan_contract_model.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:hash_store/logic/currency_converter_cubit.dart';
import 'package:hash_store/logic/cubit/login/login_cubit.dart';
import 'package:hash_store/logic/cubit/sign_up/sign_up_cubit.dart';
import 'package:hash_store/presentation/Home/screen/home_screen.dart';
import 'package:hash_store/presentation/splash/screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/http/http_service.dart';
import 'logic/cubit/update_password/update_password_cubit.dart';
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
          create: (context) => SignUpCubit(SignUpAPI()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            LoginApi(),
            LoginResponseModel(),
            SecureStorage(),
          )..tryAutoLogin(),
        ),
        BlocProvider<UpdatePasswordCubit>(
          create: (context) =>
              UpdatePasswordCubit(updatePasswordRepo: UpdatePasswordApi()),
        ),
        BlocProvider<AssetsCubit>(
          create: (context) => AssetsCubit(PlanContractApi(),PlanContractsResponseModel())..getPlanContract(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: Strings.appTitle,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is AutoLoginLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AutoLoginSuccessState) {
                  return const HomeScreen();
                }
                return const SplashScreen();
              },
            ),
          );
        }
      ),
    );
  }
}
