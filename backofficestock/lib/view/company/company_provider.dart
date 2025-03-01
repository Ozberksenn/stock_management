import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompanyProvider extends ChangeNotifier {
  Map<String, dynamic> companyInfo = {};

  CompanyProvider() {
    onInit();
  }

  void onInit() {
    fetchCompanyInfo();
  }

  Future<void> fetchCompanyInfo() async {
    Response response = await AppService.instance.getData("/getCompanyInfo");
    if (response.data['statusCode'] == 200) {
      companyInfo = response.data['data'];
      notifyListeners();
    } else {
      print("Error");
    }
  }

  Future<void> handleSendButton(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(formKey.currentState?.value.toString());
      Response response = await AppService.instance
          .postData("/updateCompanyInfo", formKey.currentState?.value ?? {});
      if (response.statusCode == 200) {
        print("Success");
        fetchCompanyInfo();
      } else {
        print("Error");
      }
    } else {
      debugPrint('validation failed');
    }
  }
}
