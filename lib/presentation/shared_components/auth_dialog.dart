import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hash_store/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/strings.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: AlertDialog(
        title: const Text(
          'Security required',
          style: TextStyle(color: ColorManager.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          Strings.authErrorMessage,
          style: TextStyle(fontSize: 12.sp, color: ColorManager.darkWhite),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: ColorManager.white),
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: const Text(
              'Security settings',
              style: TextStyle(color: ColorManager.red),
            ),
            onPressed: () {
              AppSettings.openSecuritySettings();
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
