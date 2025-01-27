import 'package:backofficestock/product/model/menu_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  late TabController tabController;
  List<MenuModel> menuTabList = [];
  bool isMenuReady = false; // tab listesi için tutulan.
  bool isInitialized = false;
  MenuModel? selectedTab; // seçili tab bilgisi burada tutuluyor.

  void init({TickerProvider? vsync}) {
    if (isInitialized) return;
    isInitialized = true;
    getMenu(vsync);
  }

  Future<void> getMenu(vsync) async {
    isMenuReady = false;
    Response response = await AppService.instance.getData("/getMenu");
    if (response.data != null) {
      menuTabList = (response.data['data'] as List)
          .map((e) => MenuModel.fromMap(e))
          .toList()
          .cast<MenuModel>();
      tabController = TabController(length: menuTabList.length, vsync: vsync!);
    }
    selectedTab = menuTabList[0]; // seçili olan ilk menüyü burada belirliyoruz.
    isMenuReady = true;
    notifyListeners();
  }

  handleTab(MenuModel tab) {
    selectedTab = tab;
    notifyListeners();
  }
}
