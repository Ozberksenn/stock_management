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
      id: json['TableId'],
      tableNo: json['TableNo'],
      status: json['Status'],
      customerName: json['CustomerName'],
      specialText: json['SpecialText'],
      products: json['Products'] != null
          ? (jsonDecode(json['Products']) as List)
              .map((e) => TableProductModel.fromMap(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TableId': id,
      'TableNo': tableNo,
      'Status': status,
      'CustomerName': customerName,
      'SpecialText': specialText,
      'Products': products != null
          ? jsonEncode(products!.map((e) => e.toMap()).toList())
          : null,
    };
  }
}

class TableProductModel {
  final int id; // Assuming ID is optional
  final String productName;
  final double price;

  TableProductModel({
    required this.id,
    required this.productName,
    required this.price,
  });

  factory TableProductModel.fromMap(Map<String, dynamic> map) {
    return TableProductModel(
      id: map['TableProductId'],
      productName: map['ProductName'],
      price: map['Price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TableProductId': id,
      'ProductName': productName,
      'Price': price,
    };
  }
}
