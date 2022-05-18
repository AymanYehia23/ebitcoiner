import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../constants/enums.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<LocalAuth> authenticate() async {
    try {
      final bool isAuth = await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
        ),
      );
      if (isAuth) {
        return LocalAuth.authenticated;
      } else {
        return LocalAuth.notAuthenticate;
      }
    } on PlatformException catch (e) {
      if (e.message == 'Required security features not enabled') {
        return LocalAuth.securityRequired;
      }
      return LocalAuth.notAuthenticate;
    }
  }
}
