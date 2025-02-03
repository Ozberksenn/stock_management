import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../product/service/app_service.dart';
import '../../product/widgets/snackbar_widgets.dart';

class FormProvider extends ChangeNotifier {
  Future<void> handleSaveButton(
      {required BuildContext context,
      required GlobalKey<FormBuilderState> formKey,
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
        successSnackbar(context: context, message: "Success");
      } else {
        errorSnackbar(context: context, message: "Error");
      }
    } else {
      errorSnackbar(context: context, message: "Validate Error");
    }
  }

  void refreshProductList() {
    notifyListeners();
  }
}
