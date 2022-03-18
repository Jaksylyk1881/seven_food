class ErrorException implements Exception {
  String message;
  int? statusCode;
  ErrorException({required this.message, this.statusCode});
}
