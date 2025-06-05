class TableModel {
  final int id;
  final String tableNo;
  final String status;
  final String? customerName;
  final String? specialText;

  TableModel({
    required this.id,
    required this.tableNo,
    required this.status,
    this.customerName,
    this.specialText,
  });

  factory TableModel.fromMap(Map<String, dynamic> json) {
    return TableModel(
      id: json['ID'],
      tableNo: json['TABLE_NO'],
      status: json['STATUS'],
      customerName: json['CUSTOMER_NAME'],
      specialText: json['SPECIAL_TEXT'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  // 'ID': id,

  //   };
  // }
}
