import 'package:backofficestock/product/model/product_variation_model.dart';
import 'package:flutter/cupertino.dart';

class ProductVariationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> variationsList = [];
  String mainBarcodeText = "";

  ProductVariationProvider(
      List<ProductVariantModel> variationList, String mainBarcode) {
    mainBarcodeText = mainBarcode;
    init(variationList);
  }

  init(List<ProductVariantModel> list) {
    for (var variation in list) {
      variationsList.add({
        "id": variation.variantId,
        "nameTextEditingController":
            TextEditingController(text: variation.variantName),
        "barcodeTextEditingController":
            TextEditingController(text: variation.barcode),
        "quantityTextEditingController":
            TextEditingController(text: variation.quantity.toString()),
        "priceTextEditingController":
            TextEditingController(text: variation.price.toString())
      });
    }
  }

  void addVariation(int index) {
    variationsList.add({
      "nameTextEditingController": TextEditingController(),
      "barcodeTextEditingController":
          TextEditingController(text: "$mainBarcodeText/$index"),
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
