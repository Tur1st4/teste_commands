class ArgumentsException implements Exception {
  final String message;
  const ArgumentsException(this.message);

  @override
  String toString() => 'ArgumentsException: $message';
}
