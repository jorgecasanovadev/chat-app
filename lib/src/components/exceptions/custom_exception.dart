class CustomException implements Exception {
  /// Creates a [CustomException] with the specified error [code] and optional
  /// [message], and with the optional error [details] which must be a valid
  /// value for the MethodCodec involved in the interaction.
  CustomException({
    required this.code,
    this.message,
    this.details,
    this.stacktrace,
  });

  /// An error code.
  final String code;

  /// A human-readable error message, possibly null.
  final String? message;

  /// Error details, possibly null.
  ///
  /// This property is `dynamic`, which means type-checking is skipped
  ///  when accessing
  /// this property. To minimize the risk of type errors at runtime,
  ///  the value should
  /// be cast to `Object?` when accessed.
  final dynamic details;

  /// Native stacktrace for the error, possibly null.
  ///
  /// This contains the native platform stack trace, not the Dart stack trace.
  ///
  /// The stack trace for Dart exceptions can be obtained using
  /// try-catch blocks, for example:
  ///
  /// ```dart
  /// try {
  ///   ...
  /// } catch (e, stacktrace) {
  ///   print(stacktrace);
  /// }
  /// ```
  final String? stacktrace;

  @override
  String toString() =>
      'CustomException($code, $message, $details, $stacktrace)';
}
