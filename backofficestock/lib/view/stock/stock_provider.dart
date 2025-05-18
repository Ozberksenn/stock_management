import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/model/menu_model.dart';
import 'package:backofficestock/product/model/product_model.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StockProvider extends ChangeNotifier {
  late TabController tabController;
  // Lists
  List<MenuModel> menuTabList = [];
  List<ProductModel> productsList = [];
  // is Ready Variables
  bool isMenuReady = false; // tab listesi için tutulan.
  bool isProductReady = false; // ürünlerin listesi için tutulan.
  bool isInitialized = false;
  // Selecteds
  MenuModel? selectedTab; // seçili tab bilgisi burada tutuluyor.
  TickerProvider? vsync;

  void init({required TickerProvider tabVsync}) {
    if (isInitialized) return;
    isInitialized = true;
    vsync = tabVsync;
    getMenu(vsync);
    getProduct();
  }

  handleTab(MenuModel tab) {
    selectedTab = tab;
    notifyListeners();
  }

  Future<void> getMenu(vsync) async {
    isMenuReady = false;
    ApiResponse response = await AppService.instance.getData("/getMenu");
    if (response.success) {
      menuTabList = (response.data as List)
          .map((e) => MenuModel.fromMap(e))
          .toList()
          .cast<MenuModel>();
      tabController = TabController(length: menuTabList.length, vsync: vsync!);
      if (menuTabList.isNotEmpty) {
        selectedTab =
            menuTabList[0]; // seçili olan ilk menüyü burada belirliyoruz.
      }
    }
    isMenuReady = true;
    notifyListeners();
  }

  Future<void> refreshMenu() async {
    if (vsync == null) return;
    isMenuReady = false;
    ApiResponse response = await AppService.instance.getData("/getMenu");
    if (response.data != null) {
      menuTabList = (response.data as List)
          .map((e) => MenuModel.fromMap(e))
          .toList()
          .cast<MenuModel>();
      selectedTab = menuTabList.firstWhere((e) =>
          e.menuId ==
          selectedTab
              ?.menuId); // sayfa güncellendikten sonra aynı tabde kalabilmesi için yaptım.
      var initialTabIndex = menuTabList.indexWhere((e) =>
          e.menuId ==
          selectedTab
              ?.menuId); // tabin index değerini buldum ve alt satırda ki kodda verebilmek için.
      tabController = TabController(
          length: menuTabList.length,
          vsync: vsync!,
          initialIndex: initialTabIndex);
    }
    isMenuReady = true;
    notifyListeners();
  }

  Future<void> getProduct() async {
    // productlar burada çekilecek.
    isProductReady = false;
    ApiResponse response = await AppService.instance.getData("/getProducts");
    if (response.success) {
      productsList = (response.data as List)
          .map((e) => ProductModel.fromMap(e))
          .toList()
          .cast<ProductModel>();
    }
    isProductReady = true;
    notifyListeners();
  }

  Future deleteMenu(BuildContext context) async {
    ApiResponse response = await AppService.instance
        .deleteData("/deleteMenu", {"MENUID": selectedTab?.menuId});
    if (!context.mounted) return;
    if (response.success) {
      context.pop();
      successSnackbar(context: context, message: "success");
      getMenu(vsync);
    } else {
      context.pop();
      errorSnackbar(context: context, message: response.message);
    }
  }

  Future<void> deleteProduct(int id, context) async {
    ApiResponse response =
        await AppService.instance.deleteData("/deleteProduct", {"ID": id});
    if (response.success) {
      getProduct();
      successSnackbar(
          context: context, message: "Success product ID :$id deleted");
    } else {
      errorSnackbar(context: context, message: "Error");
    }
  }

  Future<void> updateOrder(BuildContext context,
      {required int productId, required int newOrder}) async {
    ApiResponse response =
        await AppService.instance.putData("/productOrderUpdate", {
      "PRODUCTID": productId,
      "NEWORDER": newOrder,
    });
    if (!context.mounted) return;
    if (response.success) {
      successSnackbar(context: context, message: "Success");
    } else {
      errorSnackbar(context: context, message: "Error");
    }
  }

  void uiOrderUpdate(oldIndex, newIndex, List<ProductModel> filterList) {
    final movedItem = filterList[oldIndex];
    final actualOldIndex = productsList.indexWhere((e) => e.id == movedItem.id);

    final newItem = filterList[newIndex];
    final actualNewIndex = productsList.indexWhere((e) => e.id == newItem.id);

    final moved = productsList.removeAt(actualOldIndex);
    productsList.insert(actualNewIndex, moved);

    notifyListeners();
  }
}
