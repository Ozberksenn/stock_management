class TableModel {
  final int id;
  final String tableNo;
  final String status;
  final String? customerName;
  final int? customerCount;
  final String? specialText;
  final int companyId;

  TableModel({
    required this.id,
    required this.tableNo,
    required this.status,
    this.customerName,
    this.customerCount,
    this.specialText,
    required this.companyId,
  });

  factory TableModel.fromMap(Map<String, dynamic> json) {
    return TableModel(
      id: json['ID'],
      tableNo: json['TABLE_NO'],
      status: json['STATUS'],
      customerName: json['CUSTOMER_NAME'],
      customerCount: json['CUSTOMER_COUNT'],
      specialText: json['SPECIAL_TEXT'],
      companyId: json['COMPANY_ID'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  // 'ID': id,

  //   };
  // }
}
