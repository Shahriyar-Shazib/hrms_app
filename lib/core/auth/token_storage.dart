import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _kAccessToken = 'access_token';
const _kRefreshToken = 'refresh_token';
const _kRememberFlag = 'remember_flag';
const _kRememberEmail = 'remember_email';
const _kRememberPassword = 'remember_password';

class TokenStorage {
  const TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _kAccessToken, value: accessToken),
      _storage.write(key: _kRefreshToken, value: refreshToken),
    ]);
  }

  Future<String?> readAccessToken() => _storage.read(key: _kAccessToken);
  Future<String?> readRefreshToken() => _storage.read(key: _kRefreshToken);

  /// Clears session tokens only. Deliberately does NOT touch remembered
  /// login credentials — logging out should not forget "Remember me".
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _kAccessToken),
      _storage.delete(key: _kRefreshToken),
    ]);
  }

  Future<void> saveRememberedCredentials({
    required String email,
    required String password,
  }) async {
    await Future.wait([
      _storage.write(key: _kRememberFlag, value: 'true'),
      _storage.write(key: _kRememberEmail, value: email),
      _storage.write(key: _kRememberPassword, value: password),
    ]);
  }

  Future<void> clearRememberedCredentials() async {
    await Future.wait([
      _storage.delete(key: _kRememberFlag),
      _storage.delete(key: _kRememberEmail),
      _storage.delete(key: _kRememberPassword),
    ]);
  }

  /// Returns the saved (email, password) if "Remember me" was checked on a
  /// prior login, else null.
  Future<(String, String)?> readRememberedCredentials() async {
    final flag = await _storage.read(key: _kRememberFlag);
    if (flag != 'true') return null;
    final email = await _storage.read(key: _kRememberEmail);
    final password = await _storage.read(key: _kRememberPassword);
    if (email == null || password == null) return null;
    return (email, password);
  }
}

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage(const FlutterSecureStorage());
});
