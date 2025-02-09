import 'package:backofficestock/data/navigation_data.dart';
import 'package:backofficestock/product/model/navigation_model.dart';
import 'package:flutter/material.dart';

class HomeProivder extends ChangeNotifier {
  NavigationModel menu = navigationData[1]; // first menu

  void changeMenu(NavigationModel item) {
    menu = item;
    notifyListeners();
  }
}
