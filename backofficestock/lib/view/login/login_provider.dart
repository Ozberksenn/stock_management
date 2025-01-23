import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoginButton = false;

  Future<bool> handleSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isLoginButton = false;
      Response response = await AppService.instance.postData(
          "/login", {"MAIL": "test@gmail.com", "PASSWORD": "test123456"});
      if (response.data['statusCode'] == 200) {
        isLoginButton = true;
        return true;
      } else {
        return false;
      }
    } else {
      debugPrint('validation failed');
      return false;
    }
  }
}
