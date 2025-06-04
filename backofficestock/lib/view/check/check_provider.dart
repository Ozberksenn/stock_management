import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/view/check/model/table_model.dart';
import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
  List<TableModel> tables = [];
  CheckProvider() {
    onInit();
  }

  void onInit() {
    fetchGetTables();
  }

  Future<void> fetchGetTables() async {
    ApiResponse response = await AppService.instance.getData("/getTables");
    if (response.success) {
      tables = (response.data as List)
          .map((e) => TableModel.fromMap(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } else {}
  }
}
