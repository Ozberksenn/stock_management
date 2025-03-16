import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/product/utils/modal/success_popup.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginProvider extends ChangeNotifier {
  bool isActiveLoginButton = true;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int step = 0;
  // isVisibLogin
  bool isVisibleLoginPassword = true;

  changeStep(int value) {
    step = value;
    notifyListeners();
  }

  Future<ServiceResponse> handleSave(
      GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isActiveLoginButton = false;
      try {
        ApiResponse response = await AppService.instance.postData("/login",
            {"MAIL": mailController.text, "PASSWORD": passwordController.text});
        if (response.success) {
          await loginWriteStorage(response.data);
          return ServiceResponse(isSuccess: true, message: "Login Success");
        } else {
          return ServiceResponse(isSuccess: false, message: "Login Failed");
        }
      } finally {
        isActiveLoginButton = true;
        notifyListeners();
      }
    } else {
      return ServiceResponse(isSuccess: false, message: "Validation Error");
    }
  }

  loginWriteStorage(data) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(data['token']);
    debugPrint(decodedToken.toString());
    // StorageService().companyId = await decodedToken['companyId'];
    await StorageService()
        .writeStorage(StorageKeys.companyId, decodedToken['companyId']);
    await StorageService().writeStorage(StorageKeys.token, data['token']);
    await StorageService().writeStorage(StorageKeys.role, data['role']);
    await StorageService()
        .writeStorage(StorageKeys.companyName, decodedToken['companyName']);
  }

  Future<void> signUpForm(GlobalKey<FormBuilderState> formKey, context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      Map<String, dynamic> formData = {};
      formData.addAll(formKey.currentState?.value ?? {});
      ApiResponse response =
          await AppService.instance.postData("/postCustomerContact", formData);
      if (response.success) {
        successSnackbar(context: context, message: response.message);
        changeStep(0);
      } else {
        successPopup(context, message: response.data['message']);
      }
    }
  }

  visiblePassword() {
    isVisibleLoginPassword = !isVisibleLoginPassword;
    notifyListeners();
  }
}
