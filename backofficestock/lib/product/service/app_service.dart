import 'package:dio/dio.dart';

class AppService {
  late final Dio dio;
  AppService._init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.43:8080", // URL
      headers: {
        "Content-Type": "application/json", // Varsayılan header
      },
    ));
  }

  static final AppService _instance = AppService._init();

  static AppService get instance => _instance;

  Future getData(String path) async {
    final response = await dio.post(path);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
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
