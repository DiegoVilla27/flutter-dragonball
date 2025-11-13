/// @abstract AppException
/// @description Base abstract class for all custom application exceptions.
/// Provides a common structure for error handling, including a message
/// and an optional [StackTrace].
///
/// @param message A descriptive message explaining the cause of the exception.
/// @param stackTrace (Optional) The [StackTrace] associated with the exception.
///
/// @remarks
/// All custom exceptions in the app should extend this class to ensure consistent
/// error reporting and logging across the project.
abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $message';
}

/// @class NetworkException
/// @description Represents network-related errors such as lost connectivity
/// or failed requests due to connection issues.
class NetworkException extends AppException {
  NetworkException(super.message, [super.stackTrace]);
}

/// @class TimeoutException
/// @description Represents timeout-related errors when a request takes
/// longer than the allowed duration to complete.
class TimeoutException extends AppException {
  TimeoutException(super.message, [super.stackTrace]);
}

/// @class ServerException
/// @description Represents server-side errors returned by the backend API,
/// typically associated with an HTTP status code.
///
/// @param statusCode The HTTP status code returned by the server.
/// @param message A descriptive message for the server error.
/// @param stackTrace (Optional) The [StackTrace] associated with the error.
///
/// @remarks
/// Use this exception to capture backend-related problems such as 400, 404, or 500 errors.
class ServerException extends AppException {
  final int statusCode;

  ServerException(this.statusCode, String message, [StackTrace? stackTrace])
    : super(message, stackTrace);
}

/// @class ParsingException
/// @description Represents errors that occur while parsing or interpreting data,
/// such as JSON decoding failures or invalid response formats.
class ParsingException extends AppException {
  ParsingException(super.message, [super.stackTrace]);
}

/// @class UnknownException
/// @description Represents unexpected or unclassified errors that do not match
/// any specific exception type.
///
/// @remarks
/// This exception acts as a fallback for unexpected behaviors or unidentified errors.
class UnknownException extends AppException {
  UnknownException(super.message, [super.stackTrace]);
}
