import 'package:flutter_dragonball/core/di/di.dart';
import 'package:flutter_dragonball/features/characters/domain/entities/characters/characters.entity.dart';
import 'package:flutter_dragonball/features/characters/domain/use_cases/get_characters.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'characters.provider.g.dart';

/// @provider Characters
/// @description
/// A Riverpod asynchronous provider that manages the state of Dragon Ball characters.
/// It handles data fetching, error states, and updates the UI reactively through [AsyncValue].
///
/// @remarks
/// This provider interacts with the [GetCharactersUseCase] to retrieve character data
/// from the domain layer using dependency injection (DI). It also manages loading and
/// error states automatically through Riverpod's state mechanism.
@riverpod
class Characters extends _$Characters {
  /// @override
  /// @function build
  /// @description
  /// Initializes the provider state by calling [loadCharacters].
  /// Automatically executed when the provider is first read or refreshed.
  ///
  /// @return {Future<CharactersEntity>}
  /// A [Future] that resolves with the loaded list of characters.
  @override
  Future<CharactersEntity> build() async {
    print('🌀 build() executed');
    return await loadCharacters();
  }

  /// @function loadCharacters
  /// @description
  /// Fetches Dragon Ball characters using the [GetCharactersUseCase].
  /// It updates the provider’s state with loading, success, or error values
  /// depending on the API response.
  ///
  /// @remarks
  /// This function ensures the UI remains responsive and reacts properly
  /// to state transitions (loading → success/error).
  ///
  /// @return {Future<CharactersEntity>}
  /// A [Future] resolving to a [CharactersEntity] containing character data.
  Future<CharactersEntity> loadCharacters() async {
    print('🚀 Loading characters...');
    final getCharactersUseCase = di<GetCharactersUseCase>();

    state = const AsyncValue.loading();

    try {
      final characters = await getCharactersUseCase.repository.getCharacters();
      print('✅ Characters loaded successfully');
      state = AsyncValue.data(characters);
      return characters;
    } catch (e, st) {
      print('❌ Error loading characters: $e');
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
