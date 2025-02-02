import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../product/service/app_service.dart';

class FormProvider extends ChangeNotifier {
  Future<ServiceResponse> handleSaveButton(
      {required GlobalKey<FormBuilderState> formKey,
      required String url,
      bool? edit,
      Map<String, dynamic>? parameters}) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(formKey.currentState?.value.toString());
      Map<String, dynamic> formData = {};
      formData.addAll(parameters ?? {});
      formData.addAll(formKey.currentState?.value ?? {});
      Response? response;
      if (edit == false) {
        response = await AppService.instance.postData(url, formData);
      } else {
        response = await AppService.instance.putData(url, formData);
      }
      if (response?.data['statusCode'] == 200) {
        return ServiceResponse(isSuccess: true, message: "Success");
      } else {
        return ServiceResponse(isSuccess: false, message: "Error");
      }
    } else {
      return ServiceResponse(isSuccess: false, message: "Validation Error");
    }
  }
}
