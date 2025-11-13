import 'package:flutter_dragonball/features/characters/di/characters.di.dart';
import 'package:get_it/get_it.dart';

/// @variable di
/// @description Global instance of the [GetIt] service locator.
/// Used to register and retrieve dependency injections across the entire application.
final di = GetIt.instance;

/// @function initDI
/// @description Initializes and registers all global dependency injections required by the app.
/// This includes setting up feature-specific modules and their respective dependencies.
///
/// @remarks
/// This function should be called once during the application startup,
/// before any dependency-injected service or repository is accessed.
///
/// @return A [Future] that completes when all dependency injections are successfully initialized.
Future<void> initDI() async {
  // Features
  await initCharactersInjections();
}
