import 'package:flutter_dragonball/utils/enums/enums.utils.dart';

/// @class CharacterEntity
/// @description
/// Represents the domain entity for a Dragon Ball character used across the business logic layer.
/// It abstracts raw data models into meaningful entities that encapsulate the character’s core information,
/// such as race, gender, Ki power, and transformations.
///
/// @remarks
/// This entity is used in the domain layer and should not depend on any data source or framework.
/// It ensures separation of concerns by representing pure business data.
class CharacterEntity {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final GenderEntity gender;
  final String description;
  final String image;
  final String affiliation;
  final List<TransformationEntity>? transformations;

  /// @constructor
  /// Creates a [CharacterEntity] instance.
  ///
  /// @params
  /// - [id] The unique identifier of the character.
  /// - [name] The name of the character.
  /// - [ki] The current Ki (energy level) of the character.
  /// - [maxKi] The maximum Ki (energy limit) of the character.
  /// - [race] The race or species of the character (e.g., Saiyan, Namekian).
  /// - [gender] The gender of the character as [GenderEntity].
  /// - [description] A detailed biography or description of the character.
  /// - [image] The URL of the character’s image.
  /// - [affiliation] The organization or faction the character belongs to.
  /// - [transformations] A list of transformations the character can achieve, if any.
  CharacterEntity({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    this.transformations,
  });

  /// @factory
  /// @description
  /// Creates a [CharacterEntity] from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object containing character data.
  /// @return {CharacterEntity} A fully initialized [CharacterEntity] instance.
  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      ki: json['ki'] as String,
      maxKi: json['maxKi'] as String,
      race: json['race'] as String,
      gender: enumFromString<GenderEntity>(
        json['gender'] as String?,
        GenderEntity.values,
        defaultValue: GenderEntity.MALE,
      ),
      description: json['description'] as String,
      image: json['image'] as String,
      affiliation: json['affiliation'] as String,
      transformations:
          (json['transformations'] as List<dynamic>)
              .map(
                (item) =>
                    TransformationEntity.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

/// @enum GenderEntity
/// @description
/// Represents the gender options available for characters at the domain level.
/// Used to distinguish between male and female entities.
enum GenderEntity { FEMALE, MALE }

/// @class TransformationEntity
/// @description
/// Represents a transformation or evolved form of a character at the domain level.
/// Each transformation has a unique identity, Ki level, name, and visual representation.
///
/// @remarks
/// This entity captures transformation states (e.g., Super Saiyan, Golden Form) within the domain logic.
class TransformationEntity {
  final int id;
  final String name;
  final String image;
  final String ki;

  /// @constructor
  /// Creates a [TransformationEntity] instance.
  ///
  /// @params
  /// - [id] The unique identifier of the transformation.
  /// - [name] The name of the transformation (e.g., “Super Saiyan”).
  /// - [image] The URL of the transformation’s visual representation.
  /// - [ki] The Ki power level associated with the transformation.
  TransformationEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
  });

  /// @factory
  /// @description
  /// Creates a [TransformationEntity] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing the transformation data.
  /// @return {TransformationEntity} A fully initialized [TransformationEntity].
  factory TransformationEntity.fromJson(Map<String, dynamic> json) {
    return TransformationEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      ki: json['ki'] as String,
    );
  }
}
