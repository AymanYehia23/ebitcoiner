import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/presentation/assets/screen/assets_screen.dart';
import 'package:hash_store/presentation/devices/screen/devices_screen.dart';
import 'package:hash_store/presentation/hashrate/screen/hashrate_screen.dart';
import 'package:hash_store/presentation/profile/screen/profile_screen.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
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
  Color color = Colors.transparent;
  bool isFloatingButton = false;
  String navigatorName = '';

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
      } else if (_selectedIndex == 3) {
        title = 'Wallet';
        color = Colors.black;
        isFloatingButton = false;
      } else if (_selectedIndex == 4) {
        title = 'Profile';
        color = Colors.black;
        isFloatingButton = false;
      } else {
        title = '';
        color = Colors.transparent;
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
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}
