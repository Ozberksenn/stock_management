import 'package:backofficestock/data/navigation_data.dart';
import 'package:flutter/material.dart';

class HomeProivder extends ChangeNotifier {
  int menuId = navigationData[0].id; // first menu ID

  void changeMenu(int id) {
    menuId = id;
    notifyListeners();
  }
}
