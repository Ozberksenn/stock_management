import 'dart:convert';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:flutter/material.dart';
import '../../product/utils/modal/success_popup.dart';
import '../../product/utils/modal/warning_popup.dart';

class SaleProvider extends ChangeNotifier {
  bool isReady = false;
  ProductModel? productFounded;
  List<ProductModel> productList = [];
  TextEditingController barcodeTextController = TextEditingController();
  double totalPrice = 0.0;

  Future<void> searchBarcode(BuildContext context) async {
    isReady = false;
    ApiResponse response = await AppService.instance.postData(
        "/findProductWithBarcode", {"BARCODE": barcodeTextController.text});
    if (response.success) {
      if ((response.data as List).isNotEmpty) {
        productFounded = ProductModel.fromMap(response.data[0]);
        sameProductIdControll(context); // aynı üründen varsa listeye eklemiyor.
        isReady = true;
        notifyListeners();
      } else {
        isReady = false;
      }
    } else {
      isReady = false;
    }
  }

  Future sendProducts(BuildContext context) async {
    if (productList.isNotEmpty) {
      List<dynamic> newList =
          productList.map((product) => product.toJsonStock()).toList();
      var jsonProductList = jsonEncode(newList);
      ApiResponse response = await AppService.instance.postData(
          "/updateProductQuantity", {"PRODUCTJSONDATA": jsonProductList});
      if (!context.mounted) return;
      if (response.success) {
        productList.clear();
        isReady = false;
        barcodeTextController.text = "";
        successPopup(context, message: response.message);
        notifyListeners();
      } else {
        errorPopup(context, message: response.message);
      }
    }
  }

  void handlePlus(ProductModel product, context) {
    if (product.basketQuantity < product.quantity) {
      product.basketQuantity += 1;
      getTotalPrice();
      notifyListeners();
    } else {
      errorPopup(context, message: "Insufficient Stock");
    }
  }

  void handleMinus(ProductModel product, context) {
    if (product.basketQuantity > 1) {
      product.basketQuantity -= 1;
      getTotalPrice();
      notifyListeners();
    } else {
      errorPopup(context, message: "cannot be less than 1");
    }
  }

  handleDelete(ProductModel product) {
    productList.removeWhere((item) => item.id == product.id);
    getTotalPrice();
    notifyListeners();
  }

  getTotalPrice() {
    totalPrice = 0.0;
    for (var i in productList) {
      totalPrice += (i.basketQuantity * i.price!);
    }
    notifyListeners();
  }

  sameProductIdControll(context) {
    bool exists = productList.any((item) => item.id == productFounded!.id);
    if (exists) {
    } else {
      if (productFounded?.quantity != 0) {
        productList.add(productFounded!);
        getTotalPrice();
      } else {
        warningPopup(context, message: "insufficient stock");
      }
    }
  }

  clearBasketList() {
    productList = [];
    getTotalPrice();
    notifyListeners();
  }
}
