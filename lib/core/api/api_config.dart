import 'package:flutter/foundation.dart';

class ApiConfig {
  /// Release build (installed APK) — LAN IP so a physical device can reach it.
  static const String _releaseUrl = 'https://experience-ben-zip-traditional.trycloudflare.com/api/v1';

  /// Debug build (`flutter run`) — Android emulator's alias for the host
  /// machine's localhost. Use http://10.0.2.2:8002/api/v1 for iOS simulator.
  static const String _debugUrl = 'https://experience-ben-zip-traditional.trycloudflare.com/api/v1';

  static const String baseUrl = kReleaseMode ? _releaseUrl : _debugUrl;
}
