import 'dart:convert';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../product/utils/modal/success_popup.dart';

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
    ApiResponse response = await AppService.instance.getData("/getCompanyInfo");
    if (response.success) {
      companyInfo = response.data[0];
      isReady = true;
    } else {
      isReady = false;
    }
    notifyListeners();
  }

  Future<void> handleSendButton(
      GlobalKey<FormBuilderState> formKey, context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final Map<String, dynamic> originalData =
          formKey.currentState?.value ?? {};
      final Map<String, dynamic> data = Map<String, dynamic>.from(originalData);
      if (data.containsKey("WORKINGHOURS")) {
        data["WORKINGHOURS"] = jsonEncode(data["WORKINGHOURS"]);
      }
      if (data.containsKey("SOCIALMEDIA")) {
        data["SOCIALMEDIA"] = jsonEncode(data["SOCIALMEDIA"]);
      }
      ApiResponse response =
          await AppService.instance.postData("/updateCompanyInfo", data);
      if (response.success == true) {
        successPopup(context);
        fetchCompanyInfo();
      } else {
        errorPopup(context, message: response.data['error']);
      }
    } else {
      errorPopup(context);
    }
  }
}
