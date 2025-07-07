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
        id: json['Id'],
        companyName: json['CompanyName'],
        contactMail: json['ContactMail'],
        description: json['Description'],
        phone: json['Phone']);
  }
}
