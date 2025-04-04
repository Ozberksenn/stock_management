import 'dart:convert';

class ProductModel {
  final int id;
  final int companyId;
  final int menuId;
  final String productName;
  final String? productDescription;
  final double? price;
  final int count;
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
      required this.count,
      this.image,
      this.showStore,
      required this.barcode,
      this.prodcutVariation,
      this.sort,
      this.basketQuantity = 1});

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
        id: json['ID'],
        companyId: json['COMPANYID'],
        menuId: json['MENUID'],
        productName: json['PRODUCTNAME'],
        productDescription: json['PRODUCTDESCRIPTION'],
        price: json['PRICE'],
        count: json['COUNT'],
        image: json['IMAGE'],
        showStore: json["SHOWSTORE"] ?? true,
        barcode: json['BARCODE'] ?? "",
        prodcutVariation: json['PRODUCTVARIATION'],
        sort: json['SORT'],
        basketQuantity: 1);
  }

  factory ProductModel.toMap(json) {
    return ProductModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'COMPANYID': companyId,
      'MENUID': menuId,
      'PRODUCTNAME': productName,
      'PRODUCTDESCRIPTION': productDescription,
      'PRICE': price.toString(),
      'COUNT': count.toString(),
      'IMAGE': image,
      'SHOWSTORE': showStore,
      'BARCODE': barcode,
      'SORT': sort,
      'PRODUCTVARIATION': prodcutVariation,
    };
  }

  Map<String, dynamic> toJsonStock() {
    return {
      'ID': id,
      'COUNT': count - basketQuantity,
    };
  }
}
