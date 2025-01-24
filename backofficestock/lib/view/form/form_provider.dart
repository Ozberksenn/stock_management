import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../product/service/app_service.dart';

class FormProvider extends ChangeNotifier {
  int formEdit = 0;

  Future<void> handleSaveButton(
      GlobalKey<FormBuilderState> formKey, url) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(formKey.currentState?.value.toString());
      Response response = await AppService.instance
          .postData(url, formKey.currentState?.value ?? {});
      if (response.data['statusCode'] == 200) {
        // todo : Success  mesajı
        print("Başarılı.");
      } else {
        // todo : Eror mesajı
        print("Hatalı");
      }
    } else {
      debugPrint('validation failed');
    }
  }
}
