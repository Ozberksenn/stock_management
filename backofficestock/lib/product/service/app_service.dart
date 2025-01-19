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
    final response = await dio.get(path);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future postData(String path, Object data) async {
    final response = await dio.post(path, data: data);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
