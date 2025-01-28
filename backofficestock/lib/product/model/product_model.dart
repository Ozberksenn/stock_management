import 'dart:convert';

class ProductModel {
  final int id;
  final int companyId;
  final int menuId;
  final String productName;
  final String? productDescription;
  final int? price;
  final int? count;
  final String? image;
  final int? bandId;

  ProductModel(
      {required this.id,
      required this.companyId,
      required this.menuId,
      required this.productName,
      this.productDescription,
      this.price,
      this.count,
      this.image,
      this.bandId});

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
    );
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
      'PRICE': price,
      'COUNT': count,
      'IMAGE': image,
      'BANDID': bandId,
    };
  }
}
