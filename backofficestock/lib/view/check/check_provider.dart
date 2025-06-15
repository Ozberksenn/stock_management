import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/view/check/model/table_model.dart';
import 'package:flutter/material.dart';

import '../../product/model/product_model.dart';

class CheckProvider extends ChangeNotifier {
  List<TableModel> tables = [];
  List<ProductModel> products = [];
  TableModel? selectedTable;
  bool isAdded = true;
  int activeTable = 0;
  int allTable = 0;
  int reservedTable = 0;

  CheckProvider() {
    onInit();
  }

  void onInit() {
    fetchGetTables();
    fetchProducts();
  }

  Future<void> fetchGetTables() async {
    ApiResponse response = await AppService.instance.getData("/getTables");
    if (response.success) {
      tables = (response.data as List)
          .map((e) => TableModel.fromMap(e as Map<String, dynamic>))
          .toList();
      allTable = tables.length;
      activeTable = tables.where((table) => table.status == "Active").length;
      reservedTable =
          tables.where((table) => table.status == "Reserved").length;
      notifyListeners();
    } else {}
  }

  fetchProducts() async {
    ApiResponse response = await AppService.instance.getData("/getProducts");
    if (response.success) {
      products = (response.data as List)
          .map((e) => ProductModel.fromMap(e))
          .toList()
          .cast<ProductModel>();
      notifyListeners();
    }
  }

  handleAddNewItem(ProductModel product) {
    selectedTable?.products?.add(TableProductModel(
        productName: product.productName, price: product.price!));
    notifyListeners();
  }
}
