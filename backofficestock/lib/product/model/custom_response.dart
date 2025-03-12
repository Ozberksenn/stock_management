class ApiResponse {
  final bool success;
  final dynamic data;
  final String message;

  ApiResponse(
      {required this.success, required this.data, required this.message});

  factory ApiResponse.fromMap(Map<String, dynamic> json) {
    return ApiResponse(
        success: json['success'], data: json['data'], message: json['message']);
  }
}
