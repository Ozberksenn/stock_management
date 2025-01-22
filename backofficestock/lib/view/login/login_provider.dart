import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginProvider extends ChangeNotifier {
  Future<void> handleSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      Response response = await AppService.instance
          .postData("/login", {"MAIL": "ad", "PASSWORD": "sdasd"});
      if (response.statusCode == 200) {
      } else {
        print('error');
      }
      debugPrint(formKey.currentState?.value.toString());
    } else {
      debugPrint('validation failed');
    }
  }
}
