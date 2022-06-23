import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../router/app_router.dart';

Future sessionExpiredDialog({required BuildContext context}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: AlertDialog(
          title: const Text('Session expired'),
          content: const Text(Strings.loginSessionError),
          actions: [
            TextButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRouter.firstLogin);
              },
            ),
          ],
        ),
      );
    },
  );
}