import 'package:flutter_dragonball/features/characters/domain/entities/character/character.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/characters/characters.entity.dart';

/// @abstract
/// @class CharactersRepository
/// @description
/// Defines the contract for fetching Dragon Ball character data within the domain layer.
/// Acts as an abstraction layer between the domain use cases and the data layer,
/// ensuring that domain logic remains independent of data source implementations.
///
/// @remarks
/// Implementations of this repository will handle the actual data retrieval logic,
/// whether from a remote API, local database, or cache.
abstract class CharactersRepository {
  /// @method getCharacters
  /// @description
  /// Retrieves a paginated list of Dragon Ball characters.
  ///
  /// @return {Future<CharactersEntity>}
  /// A future that resolves to a [CharactersEntity] containing
  /// the list of characters and pagination metadata.
  Future<CharactersEntity> getCharacters();

  /// @method getCharacter
  /// @description
  /// Retrieves detailed information about a single Dragon Ball character by its unique [id].
  ///
  /// @param {int} id - The unique identifier of the character to retrieve.
  /// @return {Future<CharacterEntity>}
  /// A future that resolves to a [CharacterEntity] representing the requested character.
  Future<CharacterEntity> getCharacter(int id);
}
