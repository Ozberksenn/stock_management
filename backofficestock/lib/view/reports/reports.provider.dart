import 'package:backofficestock/product/model/custom_response.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:flutter/material.dart';

class ReportsProvider extends ChangeNotifier {
  ReportsProvider() {
    fetchCriticalStockQuantity();
  }

  Future<void> fetchCriticalStockQuantity() async {
    ApiResponse response =
        await AppService.instance.getData("/report-critical-stock-quantity");
    if (response.success) {
      // debugPrint(response.data);
    } else {
      debugPrint(response.message);
    }
  }
}
