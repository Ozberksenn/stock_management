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
        "priceTextEditingController":
            TextEditingController(text: variation['price'])
      });
    }
    // variationsList.add({
    //   "nameTextEditingController":
    //       TextEditingController(text: jsonDecode(list[0])),
    //   "priceTextEditingController":
    //       TextEditingController(text: jsonDecode(list[1]))
    // });
  }

  void addVariation() {
    variationsList.add({
      "nameTextEditingController": TextEditingController(),
      "priceTextEditingController": TextEditingController()
    });
    notifyListeners();
  }
}
