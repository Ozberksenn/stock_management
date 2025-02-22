import 'dart:convert';

import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SaleProvider extends ChangeNotifier {
  bool isReady = false;
  ProductModel? productFounded;
  List<ProductModel> productList = [];
  // List<dynamic> products = [];
  TextEditingController barcodeTextController = TextEditingController();

  Future<void> searchBarcode() async {
    isReady = false;
    Response response = await AppService.instance.postData(
        "/findProductWithBarcode", {"BARCODE": barcodeTextController.text});
    if (response.statusCode == 200) {
      if ((response.data['data'] as List).isNotEmpty) {
        productFounded = ProductModel.fromMap(response.data['data'][0]);
        productList.add(productFounded!);
        // products.add(response.data['data']);
        isReady = true;
        notifyListeners();
      } else {
        isReady = false;
      }
    } else {
      isReady = false;
    }
  }

  Future<void> sendProducts() async {
    if (productList.isNotEmpty) {
      List<dynamic> newList =
          productList.map((product) => product.toJsonStock()).toList();
      var jsonProductList = jsonEncode(newList);
      Response response = await AppService.instance.postData(
          "/updateProductQuantity", {"PRODUCTJSONDATA": jsonProductList});
      if (response.statusCode == 200) {
        if (response.data['statusCode'] == 200) {
          print('success');
        } else {
          print('error');
        }
      } else {
        print('error');
      }
    }
  }
}
