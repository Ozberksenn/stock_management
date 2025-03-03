import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:backofficestock/product/utils/modal/success_popup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompanyProvider extends ChangeNotifier {
  bool isReady = false;
  Map<String, dynamic> companyInfo = {};

  CompanyProvider() {
    onInit();
  }

  void onInit() {
    fetchCompanyInfo();
  }

  Future<void> fetchCompanyInfo() async {
    isReady = false;
    Response response = await AppService.instance.getData("/getCompanyInfo");
    if (response.data['statusCode'] == 200) {
      companyInfo = response.data['data'];
      isReady = true;
    } else {
      isReady = false;
    }
    notifyListeners();
  }

  Future<void> handleSendButton(
      GlobalKey<FormBuilderState> formKey, context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(formKey.currentState?.value.toString());
      Response response = await AppService.instance
          .postData("/updateCompanyInfo", formKey.currentState?.value ?? {});
      if (response.statusCode == 200) {
        successPopup(context);
        fetchCompanyInfo();
      } else {
        errorPopup(context);
      }
    } else {
      errorPopup(context);
    }
  }
}
