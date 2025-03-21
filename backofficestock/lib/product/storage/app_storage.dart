import 'package:hive/hive.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late Box _box;

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  Future<void> init() async {
    _box = await Hive.openBox('box'); // Box'ın doğru açıldığından emin ol
  }

  Future<void> writeStorage(String key, dynamic value) async {
    await _box.put(key, value);
  }

  dynamic readStorage(String key) {
    return _box.get(key);
  }

  Future<void> deleteStorage(String key) async {
    await _box.delete(key);
  }

  Future<void> clearStorage() async {
    await _box.clear();
  }

  String get token => _box.get(StorageKeys.token, defaultValue: "");
  String? get companyName =>
      _box.get(StorageKeys.companyName, defaultValue: "");
  int get companyId => _box.get(StorageKeys.companyId, defaultValue: 0);
  int get role => _box.get(StorageKeys.role, defaultValue: 0);

  Future<void> setToken(String value) async =>
      await writeStorage(StorageKeys.token, value);
  Future<void> setCompanyName(String value) async =>
      await writeStorage(StorageKeys.companyName, value);
  Future<void> setCompanyId(int value) async =>
      await writeStorage(StorageKeys.companyId, value);
  Future<void> setRole(int value) async =>
      await writeStorage(StorageKeys.role, value);
}

abstract class StorageKeys {
  static const String companyId = "companyId";
  static const String companyName = "companyName";
  static const String token = "token";
  static const String role = "role";
}
