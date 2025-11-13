// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// @provider Characters
/// @description
/// A Riverpod asynchronous provider that manages the state of Dragon Ball characters.
/// It handles data fetching, error states, and updates the UI reactively through [AsyncValue].
///
/// @remarks
/// This provider interacts with the [GetCharactersUseCase] to retrieve character data
/// from the domain layer using dependency injection (DI). It also manages loading and
/// error states automatically through Riverpod's state mechanism.

@ProviderFor(Characters)
const charactersProvider = CharactersProvider._();

/// @provider Characters
/// @description
/// A Riverpod asynchronous provider that manages the state of Dragon Ball characters.
/// It handles data fetching, error states, and updates the UI reactively through [AsyncValue].
///
/// @remarks
/// This provider interacts with the [GetCharactersUseCase] to retrieve character data
/// from the domain layer using dependency injection (DI). It also manages loading and
/// error states automatically through Riverpod's state mechanism.
final class CharactersProvider
    extends $AsyncNotifierProvider<Characters, CharactersEntity> {
  /// @provider Characters
  /// @description
  /// A Riverpod asynchronous provider that manages the state of Dragon Ball characters.
  /// It handles data fetching, error states, and updates the UI reactively through [AsyncValue].
  ///
  /// @remarks
  /// This provider interacts with the [GetCharactersUseCase] to retrieve character data
  /// from the domain layer using dependency injection (DI). It also manages loading and
  /// error states automatically through Riverpod's state mechanism.
  const CharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'charactersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$charactersHash();

  @$internal
  @override
  Characters create() => Characters();
}

String _$charactersHash() => r'936730be10eed9308077625c62228597fd1b77a2';

/// @provider Characters
/// @description
/// A Riverpod asynchronous provider that manages the state of Dragon Ball characters.
/// It handles data fetching, error states, and updates the UI reactively through [AsyncValue].
///
/// @remarks
/// This provider interacts with the [GetCharactersUseCase] to retrieve character data
/// from the domain layer using dependency injection (DI). It also manages loading and
/// error states automatically through Riverpod's state mechanism.

abstract class _$Characters extends $AsyncNotifier<CharactersEntity> {
  FutureOr<CharactersEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<CharactersEntity>, CharactersEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CharactersEntity>, CharactersEntity>,
              AsyncValue<CharactersEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
