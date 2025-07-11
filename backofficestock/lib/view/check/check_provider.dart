import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/utils/modal/error_popup.dart';
import 'package:backofficestock/product/utils/modal/success_popup.dart';
import 'package:backofficestock/view/check/model/table_model.dart';
import 'package:flutter/material.dart';
import '../../product/model/product_model.dart';

class CheckProvider extends ChangeNotifier {
  List<TableModel> tables = [];
  List<ProductModel> products = [];
  List<ProductModel> filtredProducts = [];
  TableModel? selectedTable;
  bool isTable = false;
  int activeTable = 0;
  int allTable = 0;
  int reservedTable = 0;
  String? searchOrderValue = "";

  CheckProvider() {
    onInit();
  }

  void onInit() {
    fetchGetTables();
    fetchProducts();
  }

  changeStep(bool value) {
    isTable = value;
    notifyListeners();
  }

  Future<void> fetchGetTables() async {
    changeStep(false);
    ApiResponse response = await AppService.instance.getData("/getTables");
    if (response.success) {
      tables = (response.data as List)
          .map((e) => TableModel.fromMap(e as Map<String, dynamic>))
          .toList();
      allTable = tables.length;
      activeTable = tables.where((table) => table.status == "Active").length;
      reservedTable =
          tables.where((table) => table.status == "Reserved").length;
      changeStep(true);
    } else {
      debugPrint(response.message);
      changeStep(false);
    }
    notifyListeners();
  }

  void fetchProducts() async {
    // todo : productslar başka bir yerde çekiliyor tekrar burada istek atmaya gerek yok.
    ApiResponse response = await AppService.instance.getData("/getProducts");
    if (response.success) {
      products = (response.data as List)
          .map((e) => ProductModel.fromMap(e))
          .toList()
          .cast<ProductModel>();
      notifyListeners();
    }
  }

  void handleAddNewItem(ProductModel product, BuildContext context) async {
    selectedTable?.products?.add(TableProductModel(
        id: product.id,
        productName: product.productName,
        price: product.price!));
    ApiResponse response = await AppService.instance.postData(
        "/createTableProduct",
        {"TableId": selectedTable?.id, "ProductId": product.id});
    // if (!context.mounted) return;
    if (response.success) {
    } else {
      errorPopup(context, message: response.message);
    }
    notifyListeners();
  }

  void removeTableCondition(String status, BuildContext context, int id) {
    if (status == "Active") {
      errorPopup(context, message: "Cannot delete a Active table.");
    } else if (status == "Reserved") {
      errorPopup(context, message: "Cannot delete a reserved table.");
    } else {
      deleteTable(id, context);
    }
  }

  void deleteTable(int id, BuildContext context) async {
    ApiResponse response =
        await AppService.instance.deleteData("/deleteTable", {"TableId": id});
    if (!context.mounted) return;
    if (response.success) {
      tables.removeWhere((table) => table.id == id);
      allTable = tables.length;
      activeTable = tables.where((table) => table.status == "Active").length;
      reservedTable =
          tables.where((table) => table.status == "Reserved").length;
      notifyListeners();
    } else {
      errorPopup(context, message: response.message);
    }
  }

  void removeTableProdcut(
      TableProductModel product, int index, BuildContext context) async {
    ApiResponse response = await AppService.instance
        .deleteData("/deleteTableProduct", {"TableId": product.id});
    if (!context.mounted) return;
    if (response.success) {
      selectedTable?.products?.removeAt(index);
      successPopup(context, message: "Product removed successfully");
      notifyListeners();
    } else {
      errorPopup(context, message: response.message);
    }
  }

  void filterProductList(String value) {
    filtredProducts = products
        .where((item) =>
            item.productName.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
