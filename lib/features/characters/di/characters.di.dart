import 'package:flutter_dragonball/core/di/di.dart';
import 'package:flutter_dragonball/features/characters/data/data_sources/characters.datasource.dart';
import 'package:flutter_dragonball/features/characters/data/repository/character.repository_impl.dart';
import 'package:flutter_dragonball/features/characters/domain/repository/character.repository.dart';
import 'package:flutter_dragonball/features/characters/domain/use_cases/get_characters.usecase.dart';

/// Initializes all dependency injections related to the Characters feature.
///
/// This function registers:
/// - Data sources
/// - Repository implementations
/// - Use cases
///
/// All instances are registered as lazy singletons to ensure a single shared instance
/// across the app while maintaining lazy initialization.
Future<void> initCharactersInjections() async {
  // Data source
  di.registerLazySingleton<CharactersApiDataSourceImpl>(
    () => CharactersApiDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(charactersDataSourceImpl: di()),
  );

  // Use case
  di.registerLazySingleton<GetCharactersUseCase>(
    () => GetCharactersUseCase(repository: di()),
  );
}
