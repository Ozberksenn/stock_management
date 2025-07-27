import 'dart:convert';

class ProductVariantModel {
  final int variantId;
  final String variantName;
  final String barcode;
  final int quantity;
  final int price;

  ProductVariantModel({
    required this.variantId,
    required this.variantName,
    required this.barcode,
    required this.quantity,
    required this.price,
  });

  factory ProductVariantModel.fromMap(Map<String, dynamic> json) {
    return ProductVariantModel(
        variantId: json['VariantId'],
        variantName: json['VariantName'],
        barcode: json['Barcode'],
        quantity: json["Quantity"],
        price: json["Price"]);
  }

  factory ProductVariantModel.toMap(json) {
    return ProductVariantModel.fromMap(jsonDecode(json));
  }
}
