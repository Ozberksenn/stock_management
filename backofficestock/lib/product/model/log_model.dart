class LogModel {
  final int logId;
  final String company;
  final String originalUrl;
  final String body;
  final String statusCode;
  final String? statusMessage;
  final String createdAt;

  LogModel(
      {required this.logId,
      required this.company,
      required this.originalUrl,
      required this.body,
      required this.statusCode,
      this.statusMessage,
      required this.createdAt});

  factory LogModel.fromMap(Map<String, dynamic> json) {
    return LogModel(
        logId: json['LogId'],
        company: json['Company'],
        originalUrl: json['OriginalUrl'],
        body: json['Body'],
        statusCode: json['StatusCode'],
        statusMessage: json['StatusMessage'],
        createdAt: json['CreatedAt']);
  }
}
