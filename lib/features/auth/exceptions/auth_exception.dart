abstract class AuthException implements Exception {
  String get message;

  @override
  String toString() {
    return 'AuthException: $message';
  }
}
