import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/data_providers/asic_contract_api.dart';
import 'package:hash_store/data/data_providers/delete_account_api.dart';
import 'package:hash_store/data/data_providers/logout_api.dart';
import 'package:hash_store/logic/cubit/assets/assets_cubit.dart';
import 'package:hash_store/logic/cubit/delete_account/delete_account_cubit.dart';
import 'package:hash_store/logic/cubit/devices/devices_cubit.dart';
import 'package:hash_store/logic/cubit/hash_rate/hash_rate_cubit.dart';
import 'package:hash_store/logic/cubit/logout/logout_cubit.dart';
import 'package:hash_store/presentation/assets/screen/assets_screen.dart';
import 'package:hash_store/presentation/devices/screen/devices_screen.dart';
import 'package:hash_store/presentation/hashrate/screen/hashrate_screen.dart';
import 'package:hash_store/presentation/profile/screen/profile_screen.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../router/app_router.dart';
import '../../shared_components/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String title = '';
  Color color = Colors.transparent;
  bool isFloatingButton = false;
  String navigatorName = '';
  List<Widget> screens = [
    const AssetsScreen(),
    BlocProvider<HashRateCubit>(
      create: (context) =>
          HashRateCubit(context.read<AssetsCubit>().plansContractList),
      child: const HashRateScreen(),
    ),
    BlocProvider<DevicesCubit>(
      create: (context) => DevicesCubit(AsicContractApi()),
      child: const DevicesScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(
            LogoutApi(),
            SecureStorage(),
          ),
        ),
        BlocProvider<DeleteAccountCubit>(
          create: (context) => DeleteAccountCubit(
            DeleteAccountApi(),
          ),
        ),
      ],
      child: ProfileScreen(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        title = 'Hashrate plans';
        color = Colors.black;
        isFloatingButton = true;
        navigatorName = AppRouter.addPlanContract;
      } else if (_selectedIndex == 2) {
        title = 'Devices';
        color = Colors.black;
        isFloatingButton = true;
        navigatorName = AppRouter.buyMiningDevice;
      } else {
        title = '';
        color = Colors.transparent;
        isFloatingButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            title: Title(
              color: Colors.white,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            backgroundColor: color,
            centerTitle: true,
          ),
          body: screens[_selectedIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 7.h,
            items: const [
              Icon(CustomIcons.assets_icon),
              Icon(CustomIcons.hash_rate_icon),
              Icon(CustomIcons.devices_icon),
              Icon(Icons.person),
            ],
            backgroundColor: const Color(0xff1d1a27),
            onTap: (int index) {
              _onItemTapped(index);
            },
            color: const Color(0xffFF4980).withOpacity(0.8),
          ),
          floatingActionButton: isFloatingButton
              ? FloatingActionButton(
                  onPressed: () {},
                  child: SizedBox(
                    height: double.infinity,
                    child: DefaultGradientButton(
                      text: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(navigatorName);
                      },
                      isFilled: true,
                    ),
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
