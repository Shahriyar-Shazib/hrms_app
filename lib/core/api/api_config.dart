import 'package:flutter/foundation.dart';

class ApiConfig {
  /// Release build (installed APK) — LAN IP so a physical device can reach it.
  static const String _releaseUrl = 'http://192.168.0.222:8001/api/v1';

  /// Debug build (`flutter run`) — Android emulator's alias for the host
  /// machine's localhost. Use http://127.0.0.1:8001/api/v1 for iOS simulator.
  static const String _debugUrl = 'http://10.0.2.2:8001/api/v1';

  static const String baseUrl = kReleaseMode ? _releaseUrl : _debugUrl;
}
