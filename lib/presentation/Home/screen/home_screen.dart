import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/presentation/assets/screen/assets_screen.dart';
import 'package:hash_store/presentation/devices/screen/devices_screen.dart';
import 'package:hash_store/presentation/hashrate/screen/hashrate_screen.dart';
import 'package:hash_store/presentation/profile/screen/profile_screen.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:hash_store/presentation/sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    AssetsScreen(),
    const HashRateScreen(),
    const DevicesScreen(),
    const ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Sizer s = Sizer(context: context);
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(),
          body: screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/assets_icon.svg',
                  color: _selectedIndex == 0
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: 'Assets',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/hash_rate_icon.svg',
                  color: _selectedIndex == 1
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: 'Hashrate',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/devices_icon.svg',
                  color: _selectedIndex == 2
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: 'Devices',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: s.h(18),
                  backgroundImage: const AssetImage(
                    'assets/images/user_image.jpg',
                  ),
                ),
                label: 'Profile',
              ),
            ],
            backgroundColor: const Color(0xff1d1a27),
            currentIndex: _selectedIndex,
            onTap: (int index) {
              _onItemTapped(index);
            },
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color(0xffFF4980),
            elevation: 10,
          ),
        ),
      ],
    );
  }
}
