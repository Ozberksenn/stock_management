import 'dart:convert';

class TableModel {
  final int id;
  final String tableNo;
  final String status;
  final String? customerName;
  final String? specialText;
  final List<TableProductModel>? products;

  TableModel({
    required this.id,
    required this.tableNo,
    required this.status,
    this.customerName,
    this.specialText,
    this.products,
  });

  factory TableModel.fromMap(Map<String, dynamic> json) {
    return TableModel(
      id: json['ID'],
      tableNo: json['TABLE_NO'],
      status: json['STATUS'],
      customerName: json['CUSTOMER_NAME'],
      specialText: json['SPECIAL_TEXT'],
      products: json['PRODUCTS'] != null
          ? (jsonDecode(json['PRODUCTS']) as List)
              .map((e) => TableProductModel.fromMap(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'TABLE_NO': tableNo,
      'STATUS': status,
      'CUSTOMER_NAME': customerName,
      'SPECIAL_TEXT': specialText,
      'PRODUCTS': products != null
          ? jsonEncode(products!.map((e) => e.toMap()).toList())
          : null,
    };
  }
}

class TableProductModel {
  final String productName;
  final double price;

  TableProductModel({
    required this.productName,
    required this.price,
  });

  factory TableProductModel.fromMap(Map<String, dynamic> map) {
    return TableProductModel(
      productName: map['PRODUCTNAME'],
      price: map['PRICE'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'PRODUCTNAME': productName,
      'PRICE': price,
    };
  }
}
