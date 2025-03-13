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
  final int? bandId;
  final bool? showStore;
  final String? barcode;
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
      this.bandId,
      this.showStore,
      this.barcode,
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
        bandId: json['BANDID'],
        showStore: json["SHOWSTORE"] ?? true,
        barcode: json['BARCODE'],
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
      'BANDID': bandId,
      'SHOWSTORE': showStore,
      'BARCODE': barcode
    };
  }

  Map<String, dynamic> toJsonStock() {
    return {
      'ID': id,
      'COUNT': count - basketQuantity,
    };
  }
}
