import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginProvider extends ChangeNotifier {
  bool isActiveLoginButton = true;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<ServiceResponse> handleSave(
      GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isActiveLoginButton = false;
      Response response = await AppService.instance.postData("/login",
          {"MAIL": mailController.text, "PASSWORD": passwordController.text});
      if (response.data['statusCode'] == 200) {
        await loginWriteStorage(response.data);
        isActiveLoginButton = true;
        return ServiceResponse(isSuccess: true, message: "Login Success");
      } else {
        return ServiceResponse(isSuccess: false, message: "Login Failed");
      }
    } else {
      return ServiceResponse(isSuccess: false, message: "Validation Error");
    }
  }

  loginWriteStorage(data) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(data['token']);
    debugPrint(decodedToken.toString());
    StorageService().companyId = await decodedToken['companyId'];
    StorageService().token = await data['token'];
    StorageService().companyName = await decodedToken['companyName'];
  }
}
