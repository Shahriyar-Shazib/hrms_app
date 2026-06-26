class ApiException implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    this.details,
    this.httpStatus,
  });

  final String code;
  final String message;
  final dynamic details;
  final int? httpStatus;

  @override
  String toString() => 'ApiException($code): $message';
}
