import 'dart:convert';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/customer_contact_model.dart';
import 'package:backofficestock/product/model/log_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../../product/utils/modal/success_popup.dart';

class CompanyProvider extends ChangeNotifier {
  bool isReady = false;
  // bool isCreateCompanyButton = true;
  Map<String, dynamic> companyInfo = {};
  int selectedMenu = 0;

  // customer contact
  bool isCustomerContact = false;
  List<String> customerContactKeys = [];
  List<CustomerContactModel> customerContacts = [];
  List<int> deletedCustomerContactList = [];

  // logs
  bool isLogs = false;
  List<String> logKeys = [];
  List<LogModel> logs = [];

  CompanyProvider() {
    onInit();
  }

  void onInit() {
    fetchCompanyInfo();
    if (StorageService().role == 1) {
      fetchCustomerContact();
      fetchLogs();
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
    isCustomerContact = false;
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
    }
    notifyListeners();
    isCustomerContact = true;
  }

  void selectedCustomer(int id) {
    if (deletedCustomerContactList.contains(id)) {
      deletedCustomerContactList.remove(id);
    } else {
      deletedCustomerContactList.add(id);
    }
    notifyListeners();
  }

  Future<void> deletedCustomers(BuildContext context) async {
    List<Map<String, dynamic>> data = [];
    for (var i in deletedCustomerContactList) {
      data.add({"id": i});
    }
    ApiResponse response = await AppService.instance
        .deleteData("/deleteCustomerContact", {"CUSTOMERS": jsonEncode(data)});
    if (response.success) {
      context.pop();
      successSnackbar(context: context, message: response.message);
      fetchCustomerContact();
    } else {
      errorPopup(context, message: response.message);
    }
  }

  Future<void> fetchLogs() async {
    isLogs = false;
    ApiResponse response = await AppService.instance.getData("/getLogs");
    if (response.success) {
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(response.data);
      logKeys = dataList.first.keys.toList();
      logs = (response.data as List)
          .map((item) => LogModel.fromMap(item))
          .toList()
          .cast<LogModel>();
    }
    notifyListeners();
    isLogs = true;
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
      // isCreateCompanyButton = false;
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
    // isCreateCompanyButton = true;
  }

  Future<void> updatePassword(
      GlobalKey<FormBuilderState> formKey, BuildContext context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final Map<String, dynamic> data = formKey.currentState?.value ?? {};
      ApiResponse response =
          await AppService.instance.postData("/updatePassword", data);
      if (response.success) {
        successPopup(context, message: response.message);
      } else {
        errorPopup(context, message: response.message);
      }
    }
  }
}
