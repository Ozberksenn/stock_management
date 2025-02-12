import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:dio/dio.dart';

class AppService {
  static const String serviceUrl = "http://192.168.1.33:8080";
  static const String cdnUrl = "http://192.168.1.33:8080/uploads";

  late final Dio dio;
  AppService._init() {
    dio = Dio(BaseOptions(
      baseUrl: serviceUrl,
      // baseUrl: "https://helped-pig-glad.ngrok-free.app", // URL
      followRedirects: false, // Yönlendirmeyi izlemeyin
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "ngrok-skip-browser-warning": "true", // Bu başlık önemli!
        "Authorization": "Bearer ${StorageService().token}"
      },
    ));
  }

  static final AppService _instance = AppService._init();

  static AppService get instance => _instance;

  Future getData(String path) async {
    final response = await dio.get(path);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future deleteData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"COMPANYID": 1};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    final response = await dio.delete(path, data: mergedData);
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  Future postData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"COMPANYID": 1};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    final response = await dio.post(path, data: mergedData);
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  Future putData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"COMPANYID": 1};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    final response = await dio.put(path, data: mergedData);
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}

class ServiceResponse {
  final bool isSuccess;
  final Map<String, dynamic>? data;
  final String? message;

  ServiceResponse({required this.isSuccess, this.data, this.message});
}
