import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageRepo {
  Future<void> addValue({required String key, required String? value});

  Future<String?> getValue({
    required String key,
  });

  Future<void> deleteValue({
    required String key,
  });
  Future<void> deleteAll();

  Future<bool> containsKey({
    required String key,
  });
}

class SecureStorage implements SecureStorageRepo {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> addValue({required String key, required String? value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> getValue({
    required String key,
  }) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> deleteValue({
    required String key,
  }) async {
    return await _secureStorage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    return await _secureStorage.deleteAll();
  }

  @override
  Future<bool> containsKey({
    required String key,
  }) async {
    return await _secureStorage.containsKey(key: key);
  }
}
