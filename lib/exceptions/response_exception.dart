class ResponseException implements Exception {
  String message;
  ResponseException([this.message = 'Something went wrong']) {
    message = 'Weather Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
