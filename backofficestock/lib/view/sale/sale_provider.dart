import 'dart:convert';

import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SaleProvider extends ChangeNotifier {
  bool isReady = false;
  ProductModel? productFounded;
  List<ProductModel> productList = [];
  TextEditingController barcodeTextController = TextEditingController();
  int totalPrice = 0;

  Future<void> searchBarcode() async {
    isReady = false;
    Response response = await AppService.instance.postData(
        "/findProductWithBarcode", {"BARCODE": barcodeTextController.text});
    if (response.statusCode == 200) {
      if ((response.data['data'] as List).isNotEmpty) {
        productFounded = ProductModel.fromMap(response.data['data'][0]);
        sameProductIdControll(); // aynı üründen varsa listey eklemiyor.
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
          // todo : success bas
          print('success');
        } else {
          // todo : error bas
          print('error');
        }
      } else {
        // todo : error bas
        print('error');
      }
    }
  }

  void handlePlus(ProductModel product) {
    if (product.basketQuantity < product.count!) {
      product.basketQuantity += 1;
      getTotalPrice();
      notifyListeners();
    } else {
      // todo : error bas
    }
  }

  void handleMinus(ProductModel product) {
    if (product.basketQuantity > 1) {
      product.basketQuantity -= 1;
      getTotalPrice();
      notifyListeners();
    } else {
      // todo : error bas
    }
  }

  handleDelete(ProductModel product) {
    productList.remove(product);
    isReady = false;
    notifyListeners();
  }

  getTotalPrice() {
    totalPrice = 0;
    for (var i in productList) {
      totalPrice += (i.basketQuantity * i.price!);
    }
    notifyListeners();
  }

  sameProductIdControll() {
    bool exists = productList.any((item) => item.id == productFounded!.id);
    if (exists) {
      // todo uyarıyı  bas.
      print("Bu üründen mevcut, lütfen adedini arttırınız");
    } else {
      productList.add(productFounded!);
      getTotalPrice();
    }
  }
}
