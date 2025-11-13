import 'package:flutter_dotenv/flutter_dotenv.dart';

/// @class Environments
/// @description Provides access to environment variables defined in the `.env` file.
/// This class acts as a centralized configuration holder for environment-based settings.
///
/// @remarks
/// Make sure to load the environment variables before accessing them by calling
/// `await dotenv.load()` in the app initialization process.
class Environments {
  /// @variable apiUrl
  /// @description Base API URL loaded from the environment variables.
  /// Defaults to an empty string if the `API_URL` key is not found.
  static String apiUrl = dotenv.env['API_URL'] ?? "";
}
