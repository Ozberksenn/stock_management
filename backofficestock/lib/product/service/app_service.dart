import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:dio/dio.dart';

class AppService {
  // static const String serviceUrl = "http://192.168.1.33:8080";
  static const String serviceUrl =
      "https://vertically-quick-crappie.ngrok-free.app";
  // static const String cdnUrl = "http://192.168.1.34:8080/uploads";
  static const String cdnUrl = "$serviceUrl/uploads";

  late final Dio dio;
  AppService._init() {
    dio = Dio(BaseOptions(
      baseUrl: serviceUrl,
      // baseUrl: "https://helped-pig-glad.ngrok-free.app", // URL
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "ngrok-skip-browser-warning": "true", // Bu başlık önemli!
      },
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // **Burada her istekte güncel token çekiliyor**
        final token = StorageService().token;
        if (token != "" && token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));
  }

  static final AppService _instance = AppService._init();

  static AppService get instance => _instance;

  Future getData(String path) async {
    try {
      Response response = await dio.get(path);
      return parseSuccessResponse(response);
    } on DioException catch (e) {
      return ApiResponse(
          success: false, data: {}, message: e.response?.data['message']);
    }
  }

  Future deleteData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"CompanyId": StorageService().companyId};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    try {
      Response response = await dio.delete(path, data: mergedData);
      return parseSuccessResponse(response);
    } on DioException catch (e) {
      return ApiResponse(
          success: false, data: {}, message: e.response?.data['message']);
    } catch (e) {
      return ApiResponse(success: false, data: {}, message: e.toString());
    }
  }

  Future postData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"CompanyId": StorageService().companyId};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    try {
      Response response = await dio.post(path, data: mergedData);
      return parseSuccessResponse(response);
    } on DioException catch (e) {
      return ApiResponse(
          success: false, data: {}, message: e.response?.data['message']);
    } catch (e) {
      return ApiResponse(success: false, data: {}, message: e.toString());
    }
  }

  Future putData(String path, Map<String, dynamic> parameters) async {
    final defaultParams = {"CompanyId": StorageService().companyId};
    final mergedData = {
      ...defaultParams,
      ...parameters, // Gelen data sonradan yazılarak varsayılanları ezebilir
    };
    try {
      Response response = await dio.put(path, data: mergedData);
      return parseSuccessResponse(response);
    } on DioException catch (e) {
      return ApiResponse(
          success: false, data: {}, message: e.response?.data['message']);
    } catch (e) {
      return ApiResponse(success: false, data: {}, message: e.toString());
    }
  }

  ApiResponse parseSuccessResponse(Response response) {
    if (response.statusCode == 200) {
      if (response.data != null) {
        ApiResponse data = ApiResponse.fromMap(response.data);
        return data;
      } else {
        return ApiResponse(
            success: false,
            data: {},
            message: response.statusMessage.toString());
      }
    } else {
      return ApiResponse(
          success: false, data: {}, message: response.statusMessage.toString());
    }
  }
}

class ServiceResponse {
  final bool isSuccess;
  final Map<String, dynamic>? data;
  final String? message;

  ServiceResponse({required this.isSuccess, this.data, this.message});
}
