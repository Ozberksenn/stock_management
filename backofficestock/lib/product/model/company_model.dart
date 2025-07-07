class CompanyModel {
  final String companyName;
  final String? mail;
  final String? phone;
  final String? logo;
  final String? qrUrl;
  final String? address;
  final String? contactMail;
  final String? instagram;
  final String? facebook;
  final String? x;
  final String? youtube;
  final String? workingHours;
  final String? socialMedia;

  CompanyModel(
      {required this.companyName,
      this.mail,
      this.phone,
      this.logo,
      this.qrUrl,
      this.address,
      this.contactMail,
      this.instagram,
      this.facebook,
      this.x,
      this.youtube,
      this.workingHours,
      this.socialMedia});

  factory CompanyModel.fromMap(Map<String, dynamic> json) {
    return CompanyModel(
        companyName: json['CompanyName'],
        mail: json['Mail'],
        phone: json['Phone'],
        logo: json['Logo'],
        qrUrl: json['QrUrl'],
        address: json['Address'],
        contactMail: json['ContactMail'] ?? "",
        instagram: json['INSTAGRAM'],
        facebook: json['FACEBOOK'],
        x: json['X'],
        youtube: json['YOUTUBE'],
        workingHours: json['WorkingHours'],
        socialMedia: json['SocialMedia']);
  }
}
