import 'package:flutter_dragonball/features/characters/domain/entities/character/character.entity.dart';

/// @class CharactersEntity
/// @description
/// Represents a paginated collection of Dragon Ball characters at the domain layer.
/// Encapsulates both the list of character entities and pagination metadata.
///
/// @remarks
/// Used within the domain layer to handle business logic related to paginated
/// character data without depending on data layer implementations.
class CharactersEntity {
  /// A list of [CharacterEntity] objects representing individual characters.
  final List<CharacterEntity> items;

  /// Metadata describing pagination and dataset information.
  final MetaEntity meta;

  /// @constructor
  /// Creates a [CharactersEntity] instance.
  ///
  /// @params
  /// - [items] The list of [CharacterEntity] items.
  /// - [meta] The pagination metadata associated with the list.
  CharactersEntity({required this.items, required this.meta});

  /// @factory
  /// @description
  /// Creates a [CharactersEntity] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The raw JSON object containing characters and metadata.
  /// @return {CharactersEntity} A fully initialized [CharactersEntity] object.
  factory CharactersEntity.fromJson(Map<String, dynamic> json) {
    return CharactersEntity(
      items:
          (json['items'] as List<dynamic>)
              .map(
                (item) =>
                    CharacterEntity.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
      meta: MetaEntity.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }
}

/// @class MetaEntity
/// @description
/// Represents pagination metadata at the domain level.
/// Stores information about total items, pages, and the current pagination state.
///
/// @remarks
/// Unlike [MetaModel] in the data layer, this entity abstracts away API details
/// and is designed for use within the domain or business logic layer.
class MetaEntity {
  /// The total number of available items across all pages.
  final int totalItems;

  /// The number of items returned in the current page.
  final int itemCount;

  /// The number of items per page.
  final int itemsPerPage;

  /// The total number of pages available.
  final int totalPages;

  /// The current page number being viewed.
  final int currentPage;

  /// @constructor
  /// Creates a [MetaEntity] instance.
  ///
  /// @params
  /// - [totalItems] Total number of items in the dataset.
  /// - [itemCount] Number of items in the current response.
  /// - [itemsPerPage] Number of items per page.
  /// - [totalPages] Total number of pages.
  /// - [currentPage] Current page index.
  MetaEntity({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  /// @factory
  /// @description
  /// Creates a [MetaEntity] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing pagination metadata.
  /// @return {MetaEntity} A fully initialized [MetaEntity].
  factory MetaEntity.fromJson(Map<String, dynamic> json) {
    return MetaEntity(
      totalItems: json['totalItems'] as int,
      itemCount: json['itemCount'] as int,
      itemsPerPage: json['itemsPerPage'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
    );
  }
}
