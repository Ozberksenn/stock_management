import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoginButton = false;

  Future<bool> handleSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isLoginButton = false;
      Response response = await AppService.instance.postData(
          "/login", {"MAIL": "ozberksenn@gmail.com", "PASSWORD": "123456"});
      if (response.data['statusCode'] == 200) {
        isLoginButton = true;
        loginWriteStorage(response.data);
        return true;
      } else {
        return false;
      }
    } else {
      debugPrint('validation failed');
      return false;
    }
  }

  loginWriteStorage(data) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(data['token']);
    debugPrint(decodedToken.toString());
    StorageService().token = data['token'];
    StorageService().companyId = 1;
  }
}
