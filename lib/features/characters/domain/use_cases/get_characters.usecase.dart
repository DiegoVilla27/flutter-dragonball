import 'package:flutter_dragonball/features/characters/domain/entities/characters/characters.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/repository/character.repository.dart';

/// @class GetCharactersUseCase
/// @description
/// Use case responsible for retrieving a paginated list of Dragon Ball characters.
/// It communicates with the [CharactersRepository] to obtain data from the underlying data source.
///
/// @remarks
/// This class is part of the domain layer in a Clean Architecture setup.
/// It encapsulates the application-specific business logic for fetching multiple characters,
/// ensuring that the presentation layer does not depend directly on the repository implementation.
class GetCharactersUseCase {
  final CharactersRepository repository;

  /// @constructor
  /// Creates an instance of [GetCharactersUseCase].
  ///
  /// @params
  /// - [repository] The [CharactersRepository] implementation used to retrieve character lists.
  GetCharactersUseCase({required this.repository});

  /// @function call
  /// @description
  /// Executes the use case to fetch a list of Dragon Ball characters.
  ///
  /// @return {Future<CharactersEntity>}
  /// A future that resolves to a [CharactersEntity] containing character data and pagination info.
  Future<CharactersEntity> call() {
    return repository.getCharacters();
  }
}
