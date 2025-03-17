class CustomerContactModel {
  final int id;
  final String? companyName;
  final String? contactMail;
  final String? phone;
  final String? description;

  CustomerContactModel(
      {required this.id,
      this.companyName,
      this.contactMail,
      this.description,
      this.phone});

  factory CustomerContactModel.fromMap(Map<String, dynamic> json) {
    return CustomerContactModel(
        id: json['ID'],
        companyName: json['COMPANYNAME'],
        contactMail: json['CONTACTMAIL'],
        description: json['DESCRIPTION'],
        phone: json['PHONE']);
  }
}
