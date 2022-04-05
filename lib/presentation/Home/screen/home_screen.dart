import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/data_providers/delete_account_api.dart';
import 'package:hash_store/data/data_providers/logout_api.dart';
import 'package:hash_store/logic/cubit/delete_account/delete_account_cubit.dart';
import 'package:hash_store/logic/cubit/logout/logout_cubit.dart';
import 'package:hash_store/presentation/assets/screen/assets_screen.dart';
import 'package:hash_store/presentation/devices/screen/devices_screen.dart';
import 'package:hash_store/presentation/profile/screen/profile_screen.dart';
import 'package:hash_store/presentation/router/app_router.dart';
import 'package:hash_store/presentation/shared_components/default_gradient_button.dart';
import 'package:hash_store/presentation/shared_components/gradient_background_container.dart';
import 'package:sizer/sizer.dart';

import '../../hashrate/screen/hashrate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const AssetsScreen(),
    HashRateScreen(),
    DevicesScreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(LogoutApi(), SecureStorage()),
        ),
        BlocProvider<DeleteAccountCubit>(
          create: (context) => DeleteAccountCubit(DeleteAccountApi()),
        ),
      ],
      child: ProfileScreen(),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundContainer(),
        Scaffold(
          appBar: AppBar(
            title: _selectedIndex == 1
                ? Title(
                    color: Colors.white,
                    child: Text(
                      'Hashrate Plans',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                : null,
            backgroundColor: _selectedIndex == 1 ? Colors.black : null,
            centerTitle: true,
          ),
          body: screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Strings.assetsIcon,
                  color: _selectedIndex == 0
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: Strings.assets,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Strings.hashRateIcon,
                  color: _selectedIndex == 1
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: Strings.hashRate,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Strings.devicesIcon,
                  color: _selectedIndex == 2
                      ? const Color(0xffFF4980)
                      : Colors.grey,
                ),
                label: Strings.devices,
              ),
              const BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: (18),
                  backgroundImage: AssetImage(
                    Strings.userImage,
                  ),
                ),
                label: Strings.profile,
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
          floatingActionButton: _selectedIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    
                  },
                  child: SizedBox(
                    height: double.infinity,
                    child: DefaultGradientButton(
                      text: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRouter.addNewHashrate);
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
