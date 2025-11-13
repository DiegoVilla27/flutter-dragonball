import 'package:flutter_dragonball/features/characters/data/models/character/character.model.dart';

/// @class CharactersModel
/// @description
/// Represents the full response model for a paginated list of Dragon Ball characters.
/// Contains character data items, pagination metadata, and navigation links.
///
/// @remarks
/// Used in the data layer to parse API responses that include multiple characters.
class CharactersModel {
  final List<CharacterModel> items;
  final MetaModel meta;
  final LinksModel links;

  /// @constructor
  /// Creates a [CharactersModel] instance.
  ///
  /// @params
  /// - [items] A list of [CharacterModel] objects retrieved from the API.
  /// - [meta] Pagination metadata for the character list.
  /// - [links] Navigation links for paginated API results.
  CharactersModel({
    required this.items,
    required this.meta,
    required this.links,
  });

  /// @factory
  /// @description
  /// Creates a [CharactersModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The raw JSON object retrieved from the API.
  /// @return {CharactersModel} A fully initialized [CharactersModel] object.
  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      items:
          (json['items'] as List<dynamic>)
              .map(
                (item) => CharacterModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      links: LinksModel.fromJson(json['links'] as Map<String, dynamic>),
    );
  }
}

/// @class MetaModel
/// @description
/// Represents pagination metadata returned by the API.
/// Provides details about total items, pages, and current pagination state.
class MetaModel {
  final int totalItems;
  final int itemCount;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;

  /// @constructor
  /// Creates a [MetaModel] instance.
  ///
  /// @params
  /// - [totalItems] The total number of available items in the dataset.
  /// - [itemCount] The number of items returned in the current response.
  /// - [itemsPerPage] The number of items per page.
  /// - [totalPages] The total number of pages available.
  /// - [currentPage] The current page index.
  MetaModel({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  /// @factory
  /// @description
  /// Creates a [MetaModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing pagination metadata.
  /// @return {MetaModel} A fully initialized [MetaModel].
  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      totalItems: json['totalItems'] as int,
      itemCount: json['itemCount'] as int,
      itemsPerPage: json['itemsPerPage'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
    );
  }
}

/// @class LinksModel
/// @description
/// Represents pagination navigation links returned by the API.
/// Contains URLs to navigate between pages of results.
class LinksModel {
  final String first;
  final String previous;
  final String next;
  final String last;

  /// @constructor
  /// Creates a [LinksModel] instance.
  ///
  /// @params
  /// - [first] The URL for the first page of results.
  /// - [previous] The URL for the previous page of results.
  /// - [next] The URL for the next page of results.
  /// - [last] The URL for the last page of results.
  LinksModel({
    required this.first,
    required this.previous,
    required this.next,
    required this.last,
  });

  /// @factory
  /// @description
  /// Creates a [LinksModel] instance from a JSON map.
  ///
  /// @param {Map<String, dynamic>} json - The JSON object representing pagination links.
  /// @return {LinksModel} A fully initialized [LinksModel].
  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      first: json['first'] as String,
      previous: json['previous'] as String,
      next: json['next'] as String,
      last: json['last'] as String,
    );
  }
}
