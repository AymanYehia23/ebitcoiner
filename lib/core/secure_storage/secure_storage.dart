import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage _storage;

  static init() {
    _storage = const FlutterSecureStorage();
  }

  static Future<void> addValue(
      {required String key, required String? value}) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> getValue({
    required String key,
  }) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteValue({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  static Future<bool> containsKey({
    required String key,
  }) async {
    return await _storage.containsKey(key: key);
  }
}
