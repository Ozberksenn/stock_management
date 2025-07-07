import 'dart:convert';

class ProductModel {
  final int id;
  final int companyId;
  final int menuId;
  final String productName;
  final String? productDescription;
  final double? price;
  final int quantity;
  final String? image;
  final bool? showStore;
  final String barcode;
  final String? prodcutVariation;
  final int? sort; // todo required
  int basketQuantity;

  ProductModel(
      {required this.id,
      required this.companyId,
      required this.menuId,
      required this.productName,
      this.productDescription,
      this.price,
      required this.quantity,
      this.image,
      this.showStore,
      required this.barcode,
      this.prodcutVariation,
      this.sort,
      this.basketQuantity = 1});

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
        id: json['ProductId'],
        companyId: json['CompanyId'],
        menuId: json['MenuId'],
        productName: json['ProductName'],
        productDescription: json['ProductDescription'],
        price: json['Price'],
        quantity: json['Quantity'],
        image: json['Image'],
        showStore: json["ShowStore"] ?? true,
        barcode: json['Barcode'] ?? "",
        prodcutVariation: json['ProductVariation'],
        sort: json['Sort'],
        basketQuantity: 1);
  }

  factory ProductModel.toMap(json) {
    return ProductModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductId': id,
      'CompanyId': companyId,
      'MenuId': menuId,
      'ProductName': productName,
      'ProductDescription': productDescription,
      'Price': price.toString(),
      'Quantity': quantity.toString(),
      'Image': image,
      'ShowStore': showStore,
      'Barcode': barcode,
      'Sort': sort,
      'ProductVariation': prodcutVariation,
    };
  }

  Map<String, dynamic> toJsonStock() {
    return {
      'ID': id,
      'COUNT': quantity - basketQuantity,
    };
  }
}
