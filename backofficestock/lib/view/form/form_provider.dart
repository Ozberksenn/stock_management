import 'dart:async';
import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../product/service/app_service.dart';
import '../../product/widgets/snackbar_widgets.dart';

class FormProvider extends ChangeNotifier {
  bool isButton = true;

  setLoading(bool value) {
    isButton = value;
    notifyListeners();
  }

  Future<void> handleSaveButton<T extends ChangeNotifier>(
      {required BuildContext context,
      required GlobalKey<FormBuilderState> formKey,
      required String url,
      required T provider,
      String? formName,
      bool? edit,
      Map<String, dynamic>? parameters}) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      setLoading(false);
      Map<String, dynamic> formData = {};
      debugPrint(formKey.currentState?.value.toString());
      await uploadImageData(context, formData, formName ?? "");
      formData.addAll(parameters ?? {});
      formData.addAll(formKey.currentState?.value ?? {});
      ApiResponse response;
      if (edit == false) {
        response = await AppService.instance.postData(url, formData);
      } else {
        response = await AppService.instance.putData(url, formData);
      }
      if (!context.mounted) return;
      if (response.success) {
        successSnackbar(context: context, message: response.message);
        refreshImageField(context);
        formNameCondition(provider, formName);
        context.pop();
      } else {
        errorSnackbar(context: context, message: response.message);
      }
      setLoading(true);
    } else {
      errorSnackbar(context: context, message: "Validate Error");
    }
  }

  formNameCondition(provider, formName) {
    if (formName == "product") {
      refreshProduct(provider);
    } else if (formName == "menu") {
      refreshMenu(provider);
    }
  }

  refreshProduct(provider) {
    if (provider is StockProvider) {
      provider.getProduct();
    }
  }

  refreshMenu(provider) {
    if (provider is StockProvider) {
      provider.refreshMenu();
    }
  }

  refreshImageField(context) {
    final imageProvider =
        Provider.of<FormImagePickerProvider>(context, listen: false);
    imageProvider.imageFile = [];
  }

  uploadImageData(
      context, Map<String, dynamic> formData, String formName) async {
    final imageProvider =
        Provider.of<FormImagePickerProvider>(context, listen: false);
    if (imageProvider.imageFile.isNotEmpty) {
      var imageData = FormData.fromMap({
        "image": MultipartFile.fromBytes(imageProvider.imageFile.first.bytes!,
            filename: imageProvider.imageFile.first.name),
      });
      Dio dio = Dio();
      Response response = await dio.post(
        "${AppService.serviceUrl}/uploadImage",
        data: imageData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        if (formName == "menu") {
          formData.addAll({"MENUIMAGE": response.data['file']['filename']});
        } else if (formName == "product") {
          formData.addAll({"PRODUCTIMAGE": response.data['file']['filename']});
        }
      } else {
        errorSnackbar(context: context, message: response.statusMessage);
      }
    }
  }
}
