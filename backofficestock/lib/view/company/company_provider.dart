import 'dart:convert';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/customer_contact_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../product/utils/modal/success_popup.dart';

class CompanyProvider extends ChangeNotifier {
  bool isReady = false;
  bool isCreateCompanyButton = true;
  Map<String, dynamic> companyInfo = {};
  int selectedMenu = 0;

  // customer contact
  List<String> customerContactKeys = [];
  List<CustomerContactModel> customerContacts = [];

  // logs

  CompanyProvider() {
    onInit();
  }

  void onInit() {
    fetchCompanyInfo();
    if (StorageService().role == 1) {
      fetchCustomerContact();
    }
    notifyListeners();
  }

  changeMenu(int value) {
    selectedMenu = value;
    notifyListeners();
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
  }

  Future<void> fetchCustomerContact() async {
    ApiResponse response =
        await AppService.instance.getData("/getCustomerContact");
    if (response.success) {
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      customerContactKeys = dataList.first.keys.toList();
      // Çıktı: [ID, PHONE, CONTACTMAIL, COMPANYNAME, DES]
      customerContacts = (response.data as List)
          .map((item) => CustomerContactModel.fromMap(item))
          .toList()
          .cast<CustomerContactModel>();
    } else {}
  }

  Future<void> fetchLogs() async {
    ApiResponse response =
        await AppService.instance.getData("/getCustomerContact");
    if (response.success) {
    } else {}
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
      errorPopup(context, message: "Validation Error");
    }
  }

  Future<void> handleCreateCompany(
      GlobalKey<FormBuilderState> formKey, BuildContext context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isCreateCompanyButton = false;
      final Map<String, dynamic> data = formKey.currentState?.value ?? {};
      ApiResponse response =
          await AppService.instance.postData("/createCompany", data);
      if (response.success) {
        successPopup(context, message: response.message);
        formKey.currentState?.reset();
      } else {
        errorPopup(context, message: response.message);
      }
    } else {
      errorPopup(context, message: "Validation Error");
    }
    isCreateCompanyButton = true;
  }
}
