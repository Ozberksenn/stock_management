import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SaleProvider extends ChangeNotifier {
  bool isReady = false;
  ProductModel? productFounded;
  List<ProductModel> productList = [];
  TextEditingController barcodeTextController = TextEditingController();

  Future searchBarcode() async {
    isReady = false;
    Response response = await AppService.instance.postData(
        "/findProductWithBarcode", {"BARCODE": barcodeTextController.text});
    if (response.statusCode == 200) {
      if ((response.data['data'] as List).isNotEmpty) {
        productFounded = ProductModel.fromMap(response.data['data'][0]);
        productList.add(productFounded!);
        isReady = true;
        notifyListeners();
      } else {
        isReady = false;
      }
    } else {
      isReady = false;
    }
  }
}
