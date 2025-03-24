import 'package:flutter/cupertino.dart';

class ProductVariationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> variationsList = [];

  void addVariation() {
    variationsList.add({
      "nameTextEditingController": TextEditingController(),
      "priceTextEditingController": TextEditingController()
    });
    notifyListeners();
  }
}
