import 'package:flutter/cupertino.dart';

class ProductVariationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> variationsList = [];

  ProductVariationProvider(List<Map<String, dynamic>> variationList) {
    init(variationList);
  }

  init(List<Map<String, dynamic>> list) {
    debugPrint(list.toString());
    for (var variation in list) {
      variationsList.add({
        "nameTextEditingController":
            TextEditingController(text: variation['name']),
        "barcodeTextEditingController":
            TextEditingController(text: variation['barcode']),
        "quantityTextEditingController":
            TextEditingController(text: variation['quantity']),
        "priceTextEditingController":
            TextEditingController(text: variation['price'])
      });
    }
  }

  void addVariation() {
    variationsList.add({
      "nameTextEditingController": TextEditingController(),
      "barcodeTextEditingController": TextEditingController(),
      "quantityTextEditingController": TextEditingController(),
      "priceTextEditingController": TextEditingController()
    });
    notifyListeners();
  }

  void removeVaration(int index) {
    variationsList.removeAt(index);
    notifyListeners();
  }
}
