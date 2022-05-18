import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/strings.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff13111a),
      body: AlertDialog(
        title: const Text(
          'Security required',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          Strings.authErrorMessage,
          style: TextStyle(fontSize: 12.sp, color: Colors.white70),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: const Text(
              'Security settings',
              style: TextStyle(color: Colors.red),
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
