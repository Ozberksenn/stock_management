import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../product/service/app_service.dart';
import '../../product/widgets/snackbar_widgets.dart';

class FormProvider extends ChangeNotifier {
  Future<void> handleSaveButton<T extends ChangeNotifier>(
      {required BuildContext context,
      required GlobalKey<FormBuilderState> formKey,
      required String url,
      required T provider,
      String? formName,
      bool? edit,
      Map<String, dynamic>? parameters}) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      Map<String, dynamic> formData = {};
      debugPrint(formKey.currentState?.value.toString());
      await uploadImageData(context, formData, formName ?? "");
      formData.addAll(parameters ?? {});
      formData.addAll(formKey.currentState?.value ?? {});
      Response? response;
      if (edit == false) {
        response = await AppService.instance.postData(url, formData);
      } else {
        response = await AppService.instance.putData(url, formData);
      }
      if (response?.data['statusCode'] == 200) {
        refreshList(provider);
        successSnackbar(context: context, message: "Success");
        context.pop();
      } else {
        errorSnackbar(context: context, message: "Error");
      }
    } else {
      errorSnackbar(context: context, message: "Validate Error");
    }
  }

  refreshList(provider) {
    if (provider is StockProvider) {
      return provider.getProduct();
    }
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
        }
      } else {
        errorSnackbar(context: context, message: response.statusMessage);
      }
    }
  }
}
