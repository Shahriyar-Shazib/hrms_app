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
  // Laravel authorization denials (403) come back as
  // {"message":"This action is unauthorized.","exception":...} with neither
  // an 'error' nor a 'data' key. Without this check that falls through to
  // `return json['data']`, i.e. `null` — masking a FORBIDDEN as a silent
  // empty result instead of surfacing an ApiException.
  if (!json.containsKey('data')) {
    throw ApiException(
      code: json['message'] == 'This action is unauthorized.'
          ? 'FORBIDDEN'
          : 'UNEXPECTED_RESPONSE',
      message: json['message']?.toString() ?? 'Unexpected server response',
    );
  }
  return json['data'];
}
