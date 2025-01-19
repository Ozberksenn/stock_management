import 'package:backofficestock/product/model/menu_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  late TabController tabController;
  List<MenuModel> menuTabList = [];
  bool isMenuReady = false;
  StockProvider(TickerProvider vsync) {
    init(vsync);
  }

  void init(TickerProvider vsync) {
    tabController = TabController(length: 7, vsync: vsync);
    getMenu();
  }

  Future<void> getMenu() async {
    isMenuReady = false;
    Response response = await AppService.instance.getData("/getMenu");
    if (response.data != null) {
      menuTabList = (response.data['data'] as List)
          .map((e) => MenuModel.fromMap(e))
          .toList()
          .cast<MenuModel>();
      print(menuTabList[0].menuName);
    }
    isMenuReady = true;
  }
}
