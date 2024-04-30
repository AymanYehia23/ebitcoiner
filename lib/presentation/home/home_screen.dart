import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/presentation/assets/screen/assets_screen.dart';
import 'package:ebitcoiner/presentation/devices/screen/devices_screen.dart';
import 'package:ebitcoiner/presentation/hashrate/screen/hashrate_screen.dart';
import 'package:ebitcoiner/presentation/profile/screen/profile_screen.dart';
import 'package:ebitcoiner/presentation/shared_components/default_gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../router/app_router.dart';
import '../shared_components/custom_icons.dart';
import '../wallet/screen/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String title = '';
  Color color = ColorManager.transparent;
  bool isFloatingButton = false;
  String navigatorName = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        title = 'Hashrate plans';
        color = ColorManager.black;
        isFloatingButton = true;
        navigatorName = AppRouter.addPlanContract;
      } else if (_selectedIndex == 2) {
        title = 'Devices';
        color = ColorManager.black;
        isFloatingButton = true;
        navigatorName = AppRouter.buyMiningDevice;
      } else if (_selectedIndex == 3) {
        title = 'Wallet';
        color = ColorManager.black;
        isFloatingButton = false;
      } else if (_selectedIndex == 4) {
        title = 'Profile';
        color = ColorManager.black;
        isFloatingButton = false;
      } else {
        title = '';
        color = ColorManager.transparent;
        isFloatingButton = false;
      }
    });
  }

  List<Widget> screens = [
    const AssetsScreen(),
    const HashRateScreen(),
    const DevicesScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: color,
        centerTitle: true,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 7.h,
        items: const [
          Icon(Icons.home_outlined),
          Icon(CustomIcons.hash_rate_icon),
          Icon(CustomIcons.devices_icon),
          Icon(CustomIcons.assets_icon),
          Icon(Icons.person),
        ],
        backgroundColor: ColorManager.primary,
        onTap: (int index) {
          _onItemTapped(index);
        },
        color: ColorManager.secondary.withOpacity(0.8),
      ),
      floatingActionButton: isFloatingButton
          ? FloatingActionButton(
              onPressed: () {},
              child: SizedBox(
                height: double.infinity,
                child: DefaultGradientButton(
                  text: const Icon(
                    Icons.add,
                    color: ColorManager.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(navigatorName);
                  },
                  isFilled: true,
                ),
              ),
            )
          : null,
    );
  }
}
