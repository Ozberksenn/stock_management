import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeProivder extends ChangeNotifier {
  NavigationModel menu = navigationData[0]; // first menu
  List<dynamic> searchList = [];
  String searchText = "";
  // TextEditingController searchTextEditingController = TextEditingController();

  void changeMenu(NavigationModel item) {
    menu = item;
    notifyListeners();
  }

  Future<void> search() async {
    // todo model kullan.
    if (searchText.length > 1) {
      Response response = await AppService.instance
          .postData("/searchProduct", {"PRODUCTNAME": searchText});
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          for (var e in (response.data['data'] as List)) {
            if (!searchList
                .any((element) => element["PRODUCTNAME"] == e["PRODUCTNAME"])) {
              searchList.add(e);
            }
          }
        }
      }
    } else {
      searchList.clear();
    }
    notifyListeners();
  }
}
