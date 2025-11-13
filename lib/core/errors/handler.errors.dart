import 'package:dio/dio.dart';
import 'package:flutter_dragonball/core/errors/list.errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @class ExceptionHandler
/// @description Centralized exception handler that converts various types of errors
/// (e.g., network, parsing, server) into standardized [AppException] instances.
///
/// @remarks
/// This class provides a unified way to handle exceptions across the app, improving
/// consistency and error reporting. It currently supports Dio, format, and unknown exceptions.
class ExceptionHandler {
  /// @function handle
  /// @description Handles and maps any given error into a specific [AppException] subclass.
  /// It identifies the error type (network, timeout, server, etc.) and returns
  /// the appropriate exception for consistent error management.
  ///
  /// @param error The caught error or exception to handle.
  /// @param stackTrace (Optional) The stack trace associated with the error for debugging.
  /// @param ref (Optional) A [WidgetRef] instance, useful for triggering UI-related actions
  /// such as logging out on authentication errors.
  ///
  /// @return An [AppException] object representing the handled error.
  ///
  /// @remarks
  /// - This method should be used within `try-catch` blocks when calling APIs or
  ///   performing asynchronous operations.
  /// - If the error type is not recognized, it defaults to [UnknownException].
  static AppException handle(
    dynamic error, [
    StackTrace? stackTrace,
    WidgetRef? ref,
  ]) {
    if (error is DioException || error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutException(
            "The request has taken too long. Please try again.",
            stackTrace,
          );
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;

          // if (statusCode == 401) {
          //   print('logout...');
          // }

          return ServerException(
            statusCode,
            "Server error ($statusCode)",
            stackTrace,
          );
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
        default:
          return NetworkException("Unknown network error.", stackTrace);
      }
    }

    if (error is FormatException) {
      return ParsingException("Error interpreting data.", stackTrace);
    }

    return UnknownException(error.toString(), stackTrace);
  }
}
