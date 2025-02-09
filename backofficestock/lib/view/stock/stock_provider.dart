import 'package:backofficestock/product/model/menu_model.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  late TabController tabController;
  // Lists
  List<MenuModel> menuTabList = [];
  List<ProductModel> productsList = [];
  // is Ready Variables
  bool isReady = false;
  bool isMenuReady = false; // tab listesi için tutulan.
  bool isProductReady = false; // ürünlerin listesi için tutulan.
  bool isInitialized = false;
  // Selecteds
  MenuModel? selectedTab; // seçili tab bilgisi burada tutuluyor.

  void init({TickerProvider? vsync}) {
    if (isInitialized) return;
    isInitialized = true;
    getMenu(vsync);
    getProduct();
  }

  handleTab(MenuModel tab) {
    selectedTab = tab;
    notifyListeners();
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

  Future<void> getProduct() async {
    // productlar burada çekilecek.
    isProductReady = false;
    Response response = await AppService.instance.getData("/getProducts");
    if (response.data != null) {
      productsList = (response.data['data'] as List)
          .map((e) => ProductModel.fromMap(e))
          .toList()
          .cast<ProductModel>();
    }
    isProductReady = true;
    notifyListeners();
  }

  Future<void> deleteMenu() async {
    // menu silme
    Response response = await AppService.instance
        .deleteData("/deleteMenu", {"MENUID": selectedTab?.menuId});
    if (response.data['statusCode'] == 200) {
      print("başarılı");
    } else {
      print("error");
    }
  }

  Future<void> deleteProduct(int id, context) async {
    Response response =
        await AppService.instance.deleteData("/deleteProduct", {"ID": id});
    if (response.data['statusCode'] == 200) {
      getProduct();
      successSnackbar(
          context: context, message: "Success product ID :$id deleted");
    } else {
      errorSnackbar(context: context, message: "Error");
    }
  }
}
