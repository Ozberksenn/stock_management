import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:flutter/material.dart';

class HomeProivder extends ChangeNotifier {
  NavigationModel menu = navigationData[0]; // first menu
  List<dynamic> searchList = [];
  String searchText = "";

  void changeMenu(NavigationModel item) {
    menu = item;
    notifyListeners();
  }

  Future<void> search() async {
    if (searchText.length > 1) {
      ApiResponse response = await AppService.instance
          .postData("/searchProduct", {"PRODUCTNAME": searchText});
      if (response.success) {
        for (var e in (response.data as List)) {
          if (!searchList
              .any((element) => element["PRODUCTNAME"] == e["PRODUCTNAME"])) {
            searchList.add(e);
          }
        }
      }
    } else {
      searchList.clear();
    }
    notifyListeners();
  }
}
