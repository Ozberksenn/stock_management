class CompanyModel {
  final String companyName;
  final String? mail;
  final String? phone;
  final String? logo;
  final String? qrUrl;
  final String? address;
  final String? instagram;
  final String? facebook;
  final String? x;
  final String? youtube;
  final String? workingHours;

  CompanyModel(
      {required this.companyName,
      this.mail,
      this.phone,
      this.logo,
      this.qrUrl,
      this.address,
      this.instagram,
      this.facebook,
      this.x,
      this.youtube,
      this.workingHours});

  factory CompanyModel.fromMap(Map<String, dynamic> json) {
    return CompanyModel(
        companyName: json['COMPANYNAME'],
        mail: json['MAIL'],
        phone: json['PHONE'],
        logo: json['LOGO'],
        qrUrl: json['QRURL'],
        address: json['ADDRESS'],
        instagram: json['INSTAGRAM'],
        facebook: json['FACEBOOK'],
        x: json['X'],
        youtube: json['YOUTUBE'],
        workingHours: json['WORKINGHOURS']);
  }
}
