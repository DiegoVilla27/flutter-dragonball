import 'package:flutter_dragonball/features/characters/data/data_sources/characters.datasource.dart';
import 'package:flutter_dragonball/features/characters/data/mappers/characters/characters.mapper.dart';
import 'package:flutter_dragonball/features/characters/data/models/characters/characters.model.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/character/character.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/characters/characters.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/repository/character.repository.dart';

/// Implementation of the [CharactersRepository] interface.
///
/// This class is responsible for communicating with the data source layer,
/// retrieving data from the API, and converting models into domain entities.
class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersApiDataSourceImpl charactersDataSourceImpl;

  CharactersRepositoryImpl({required this.charactersDataSourceImpl});

  /// Fetches a list of characters from the API,
  /// maps the [CharactersModel] to a [CharactersEntity],
  /// and returns it to the domain layer.
  @override
  Future<CharactersEntity> getCharacters() async {
    final CharactersModel response = await charactersDataSourceImpl.getCharacters();
    return CharactersMapper.characterModelToEntity(response);
  }

  /// Fetches a single character by [id].
  ///
  /// TODO: Implement logic to retrieve one character.
  @override
  Future<CharacterEntity> getCharacter(int id) {
    throw UnimplementedError('getCharacter() has not been implemented yet.');
  }
}
