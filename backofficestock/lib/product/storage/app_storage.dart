import 'package:hive/hive.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late Box _box;

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  Future<void> init() async {
    _box = Hive.box('box');
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
  set token(String value) => writeStorage(StorageKeys.token, value);

  int get companyId => _box.get(StorageKeys.companyId, defaultValue: "");
  set companyId(int value) => writeStorage(StorageKeys.companyId, value);
}

abstract class StorageKeys {
  static const String companyId = "companyId";
  static const String token = "token";
}



  // StorageService storageService = StorageService();
  // await storageService.init();

  // Veri yazma
  // storageService.userId = 123;
  // storageService.token = "abcdef123456";
  
  // Veri okuma
  // print("User ID: ${storageService.userId}");
  // print("Token: ${storageService.token}");