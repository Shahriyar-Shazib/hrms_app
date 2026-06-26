import 'api_exception.dart';

/// Unwraps the {data} field from a success envelope.
/// Throws [ApiException] if the response contains {error}.
dynamic unwrapData(Map<String, dynamic> json) {
  if (json.containsKey('error')) {
    final err = json['error'] as Map<String, dynamic>;
    throw ApiException(
      code: err['code'] as String? ?? 'UNKNOWN',
      message: err['message'] as String? ?? 'Unknown error',
      details: err['details'],
    );
  }
  return json['data'];
}
