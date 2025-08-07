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
  final int id;
  final String productName;
  final double price;
  final List<TableProductVariantModel> variants;

  TableProductModel(
      {required this.id,
      required this.productName,
      required this.price,
      required this.variants});

  factory TableProductModel.fromMap(Map<String, dynamic> json) {
    return TableProductModel(
      id: json['TableProductId'],
      productName: json['ProductName'],
      price: json['Price'].toDouble(),
      variants: json['Variants'] != null
          ? (json['Variants'] as List)
              .map((e) => TableProductVariantModel.fromMap(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TableProductId': id,
      'ProductName': productName,
      'Price': price,
      'Variants': variants.map((e) => e.toMap()).toList()
    };
  }
}

class TableProductVariantModel {
  final int variantId;
  final String variantName;
  final double price;

  TableProductVariantModel({
    required this.variantId,
    required this.variantName,
    required this.price,
  });

  factory TableProductVariantModel.fromMap(Map<String, dynamic> map) {
    return TableProductVariantModel(
      variantId: map['VariantId'],
      variantName: map['VariantName'],
      price: map['Price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VariantId': variantId,
      'VariantName': variantName,
      'Price': price,
    };
  }
}
