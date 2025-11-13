import 'package:flutter_dragonball/features/characters/data/models/character/character.model.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/character/character.entity.dart';

/// @class CharacterMapper
/// @description Provides static methods to convert [CharacterModel] objects
/// from the data layer into [CharacterEntity] objects used in the domain layer.
///
/// @remarks
/// This mapper isolates transformation logic between layers, promoting
/// clean architecture principles by preventing direct dependencies
/// between the data and domain layers.
class CharacterMapper {
  /// @function characterModelToEntity
  /// @description Maps a [CharacterModel] instance to a [CharacterEntity].
  ///
  /// @param character The [CharacterModel] object retrieved from the API or data source.
  /// @return A [CharacterEntity] object containing domain-level data.
  static CharacterEntity characterModelToEntity(CharacterModel character) =>
      CharacterEntity(
        id: character.id,
        name: character.name,
        ki: character.ki,
        maxKi: character.maxKi,
        race: character.race,
        gender: GenderMapper.genderModelToEntity(character.gender),
        description: character.description,
        image: character.image,
        affiliation: character.affiliation,
        transformations:
            character.transformations
                ?.map(
                  (transformation) =>
                      TransformationMapper.transformationModelToEntity(
                        transformation,
                      ),
                )
                .toList(),
      );
}

/// @class GenderMapper
/// @description Handles the mapping between [GenderModel] and [GenderEntity].
///
/// @remarks
/// This ensures that gender-related data remains consistent across layers,
/// abstracting any differences between model and entity representations.
class GenderMapper {
  /// @function genderModelToEntity
  /// @description Converts a [GenderModel] enum value from the data layer
  /// into its corresponding [GenderEntity] value in the domain layer.
  ///
  /// @param gender The [GenderModel] value to be converted.
  /// @return The corresponding [GenderEntity] value.
  static GenderEntity genderModelToEntity(GenderModel gender) {
    switch (gender) {
      case GenderModel.FEMALE:
        return GenderEntity.FEMALE;
      case GenderModel.MALE:
        return GenderEntity.MALE;
    }
  }
}

/// @class TransformationMapper
/// @description Maps [TransformationModel] objects to [TransformationEntity] objects,
/// preserving the transformation details of a character.
///
/// @remarks
/// Used primarily when mapping nested transformations within a character object.
class TransformationMapper {
  /// @function transformationModelToEntity
  /// @description Converts a [TransformationModel] into a [TransformationEntity].
  ///
  /// @param transformation The [TransformationModel] instance to convert.
  /// @return A [TransformationEntity] object containing the corresponding transformation data.
  static TransformationEntity transformationModelToEntity(
    TransformationModel transformation,
  ) => TransformationEntity(
    id: transformation.id,
    name: transformation.name,
    image: transformation.image,
    ki: transformation.ki,
  );
}
