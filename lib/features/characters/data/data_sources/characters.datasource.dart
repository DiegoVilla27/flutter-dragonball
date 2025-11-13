import 'package:dio/dio.dart';
import 'package:flutter_dragonball/core/environments/environments.dart';
import 'package:flutter_dragonball/core/errors/handler.errors.dart';
import 'package:flutter_dragonball/features/characters/data/models/characters/characters.model.dart';

/// @abstract CharactersPostsApiDataSource
/// @description Defines the contract for fetching character data from a remote API.
///
/// @remarks
/// This abstraction allows different implementations (e.g., mock or real API)
/// to provide character data while maintaining a consistent interface.
abstract class CharactersPostsApiDataSource {
  /// @function getCharacters
  /// @description Retrieves a list of characters from the remote data source.
  ///
  /// @return A [Future] that resolves to a [CharactersModel] containing character data.
  Future<CharactersModel> getCharacters();
}

/// @class CharactersApiDataSourceImpl
/// @description Implementation of [CharactersPostsApiDataSource] that uses [Dio]
/// to fetch data from a RESTful API endpoint.
///
/// @remarks
/// - Uses the `Environments.apiUrl` as the base URL for network requests.
/// - Handles exceptions using the centralized [ExceptionHandler].
class CharactersApiDataSourceImpl implements CharactersPostsApiDataSource {
  /// @variable baseCharacters
  /// @description The base path for the characters API endpoint.
  final String baseCharacters = 'characters';

  /// @variable dio
  /// @description [Dio] HTTP client instance configured with the app’s base API URL.
  final Dio dio = Dio(BaseOptions(baseUrl: Environments.apiUrl));

  /// @function getCharacters
  /// @description Fetches character data from the API endpoint.
  /// Sends a GET request to `/characters` and maps the JSON response
  /// to a [CharactersModel] instance.
  ///
  /// @return A [Future] that resolves to a [CharactersModel] on success,
  /// or throws an [AppException] on failure.
  ///
  /// @remarks
  /// Errors are intercepted and converted into a standardized [AppException]
  /// through the [ExceptionHandler].
  @override
  Future<CharactersModel> getCharacters() async {
    try {
      final res = await dio.get(
        '/$baseCharacters',
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return CharactersModel.fromJson(res.data);
    } catch (e, st) {
      final appException = ExceptionHandler.handle(e, st);
      return Future.error(appException);
    }
  }
}
