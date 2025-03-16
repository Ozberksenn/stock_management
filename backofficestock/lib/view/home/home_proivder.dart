import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:flutter/material.dart';

class HomeProivder extends ChangeNotifier {
  NavigationModel menu = navigationData[0]; // first menu
  List<ProductModel> searchList = [];
  String searchText = "";

  void changeMenu(NavigationModel item) {
    menu = item;
    clearSearch();
    notifyListeners();
  }

  Future<void> search() async {
    if (searchText.length > 1) {
      ApiResponse response = await AppService.instance
          .postData("/searchProduct", {"PRODUCTNAME": searchText});
      if (response.success) {
        for (var e in response.data) {
          if (!searchList
              .any((element) => element.productName == e['PRODUCTNAME'])) {
            searchList.add(ProductModel.fromMap(e));
          }
        }
      }
    } else {
      searchList.clear();
    }
    notifyListeners();
  }

  void clearSearch() {
    searchText = "";
    searchList.clear();
  }

  isAdmin() {
    int role = StorageService().role;
    if (role == 1) {
      return true;
    } else {
      return false;
    }
  }
}
