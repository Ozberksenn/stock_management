class LogModel {
  final int id;
  final String company;
  final String originalUrl;
  final String body;
  final String statusCode;
  final String? statusMessage;
  final String createdAt;

  LogModel(
      {required this.id,
      required this.company,
      required this.originalUrl,
      required this.body,
      required this.statusCode,
      this.statusMessage,
      required this.createdAt});

  factory LogModel.fromMap(Map<String, dynamic> json) {
    return LogModel(
        id: json['ID'],
        company: json['COMPANY'],
        originalUrl: json['ORIGINALURL'],
        body: json['BODY'],
        statusCode: json['STATUSCODE'],
        statusMessage: json['STATUSMESSAGE'],
        createdAt: json['CREATED_AT']);
  }
}
