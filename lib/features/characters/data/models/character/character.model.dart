import 'package:flutter_dragonball/utils/enums/enums.utils.dart';

/// @class CharacterModel
/// @description
/// Represents a Dragon Ball character data model retrieved from the API.
/// This model includes basic character information, origin planet, and transformations.
///
/// @remarks
/// Used in the data layer to parse and represent JSON responses from the backend.
class CharacterModel {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final GenderModel gender;
  final String description;
  final String image;
  final String affiliation;
  final dynamic deletedAt;
  final OriginPlanetModel? originPlanet;
  final List<TransformationModel>? transformations;

  /// @constructor
  /// Creates a [CharacterModel] instance.
  ///
  /// @params
  /// - [id] The unique identifier of the character.
  /// - [name] The name of the character.
  /// - [ki] The base Ki energy of the character.
  /// - [maxKi] The maximum Ki energy of the character.
  /// - [race] The race or species of the character.
  /// - [gender] The gender of the character as [GenderModel].
  /// - [description] A short biography or description of the character.
  /// - [image] The URL of the character’s image.
  /// - [affiliation] The organization or group the character belongs to.
  /// - [deletedAt] The deletion timestamp, if applicable.
  /// - [originPlanet] The planet of origin of the character.
  /// - [transformations] A list of transformations associated with the character.
  CharacterModel({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    required this.deletedAt,
    this.originPlanet,
    this.transformations,
  });

  /// @factory
  /// @description
  /// Creates a [CharacterModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The raw JSON object retrieved from the API.
  /// @return {CharacterModel} A fully initialized [CharacterModel] object.
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      ki: json['ki'] as String,
      maxKi: json['maxKi'] as String,
      race: json['race'] as String,
      gender: enumFromString<GenderModel>(
        json['gender'] as String?,
        GenderModel.values,
        defaultValue: GenderModel.MALE,
      ),
      description: json['description'] as String,
      image: json['image'] as String,
      affiliation: json['affiliation'] as String,
      deletedAt: json['deletedAt'] ?? "",
      originPlanet:
          json['originPlanet'] != null
              ? OriginPlanetModel.fromJson(
                json['originPlanet'] as Map<String, dynamic>,
              )
              : null,
      transformations:
          (json['transformations'] as List<dynamic>?)
              ?.map(
                (item) =>
                    TransformationModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

/// @enum GenderModel
/// @description
/// Represents the gender options available for characters.
enum GenderModel { FEMALE, MALE }

/// @class OriginPlanetModel
/// @description
/// Represents the planet of origin of a character.
/// Includes planet details such as name, description, and destruction status.
class OriginPlanetModel {
  final int id;
  final String name;
  final bool isDestroyed;
  final String description;
  final String image;
  final dynamic deletedAt;

  /// @constructor
  /// Creates an [OriginPlanetModel] instance.
  ///
  /// @params
  /// - [id] The planet’s unique identifier.
  /// - [name] The planet’s name.
  /// - [isDestroyed] Whether the planet has been destroyed.
  /// - [description] A brief description of the planet.
  /// - [image] The image URL of the planet.
  /// - [deletedAt] The deletion timestamp, if applicable.
  OriginPlanetModel({
    required this.id,
    required this.name,
    required this.isDestroyed,
    required this.description,
    required this.image,
    required this.deletedAt,
  });

  /// @factory
  /// @description
  /// Creates an [OriginPlanetModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing a planet.
  /// @return {OriginPlanetModel} A fully initialized [OriginPlanetModel].
  factory OriginPlanetModel.fromJson(Map<String, dynamic> json) {
    return OriginPlanetModel(
      id: json['id'] as int,
      name: json['name'] as String,
      isDestroyed: json['isDestroyed'] as bool,
      description: json['description'] as String,
      image: json['image'] as String,
      deletedAt: json['deletedAt'] as dynamic,
    );
  }
}

/// @class TransformationModel
/// @description
/// Represents a transformation or power-up state of a character,
/// including its name, Ki level, and image representation.
class TransformationModel {
  final int id;
  final String name;
  final String image;
  final String ki;
  final dynamic deletedAt;

  /// @constructor
  /// Creates a [TransformationModel] instance.
  ///
  /// @params
  /// - [id] The transformation’s unique identifier.
  /// - [name] The name of the transformation.
  /// - [image] The URL representing the transformation’s appearance.
  /// - [ki] The Ki level associated with the transformation.
  /// - [deletedAt] The deletion timestamp, if applicable.
  TransformationModel({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
    required this.deletedAt,
  });

  /// @factory
  /// @description
  /// Creates a [TransformationModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing a transformation.
  /// @return {TransformationModel} A fully initialized [TransformationModel].
  factory TransformationModel.fromJson(Map<String, dynamic> json) {
    return TransformationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      ki: json['ki'] as String,
      deletedAt: json['deletedAt'] as dynamic,
    );
  }
}
