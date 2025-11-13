import 'package:flutter_dragonball/features/characters/data/mappers/character/character.mapper.dart';
import 'package:flutter_dragonball/features/characters/data/models/characters/characters.model.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/characters/characters.entity.dart';

/// @class CharactersMapper
/// @description
/// Mapper responsible for transforming a [CharactersModel] from the data layer
/// into a domain entity [CharactersEntity].
///
/// @remarks
/// This mapper handles both the list of character items and their associated metadata.
class CharactersMapper {
  /// @function characterModelToEntity
  /// @description
  /// Converts a [CharactersModel] instance into its corresponding domain entity [CharactersEntity].
  ///
  /// @param {CharactersModel} characters - The data model received from the API.
  /// @return {CharactersEntity} The mapped domain entity containing character items and metadata.
  static CharactersEntity characterModelToEntity(CharactersModel characters) =>
      CharactersEntity(
        items:
            characters.items
                .map(
                  (character) =>
                      CharacterMapper.characterModelToEntity(character),
                )
                .toList(),
        meta: MetaMapper.metaModelToEntity(characters.meta),
      );
}

/// @class MetaMapper
/// @description
/// Mapper responsible for converting a [MetaModel] (API metadata)
/// into its domain entity representation [MetaEntity].
class MetaMapper {
  /// @function metaModelToEntity
  /// @description
  /// Transforms a [MetaModel] instance into a [MetaEntity].
  ///
  /// @param {MetaModel} meta - The metadata model received from the API.
  /// @return {MetaEntity} The mapped domain entity representing metadata information.
  static MetaEntity metaModelToEntity(MetaModel meta) => MetaEntity(
    totalItems: meta.totalItems,
    itemCount: meta.itemCount,
    itemsPerPage: meta.itemsPerPage,
    totalPages: meta.totalPages,
    currentPage: meta.currentPage,
  );
}
