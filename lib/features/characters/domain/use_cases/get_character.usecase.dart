import 'package:flutter_dragonball/features/characters/domain/entities/character/character.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/repository/character.repository.dart';

/// @class GetCharacterUseCase
/// @description
/// Use case responsible for retrieving detailed information about a specific Dragon Ball character.
/// It delegates data retrieval to the [CharactersRepository] while keeping domain logic isolated
/// from the data source implementation.
///
/// @remarks
/// Part of the domain layer in the Clean Architecture structure.
/// This use case should be invoked by the presentation layer (e.g., ViewModel or Bloc)
/// to fetch data for a single character.
class GetCharacterUseCase {
  final CharactersRepository repository;

  /// @constructor
  /// Creates an instance of [GetCharacterUseCase].
  ///
  /// @params
  /// - [repository] The [CharactersRepository] implementation used to fetch character data.
  GetCharacterUseCase({required this.repository});

  /// @function call
  /// @description
  /// Executes the use case to fetch a single character by its unique [id].
  ///
  /// @param {int} id - The unique identifier of the character to retrieve.
  /// @return {Future<CharacterEntity>}
  /// A future that resolves to a [CharacterEntity] containing character details.
  Future<CharacterEntity> call(int id) {
    return repository.getCharacter(id);
  }
}
