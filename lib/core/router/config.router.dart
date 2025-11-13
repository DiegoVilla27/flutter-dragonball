import 'package:flutter_dragonball/core/router/names.router.dart';
import 'package:flutter_dragonball/features/characters/presentation/screens/details/character_detail.screen.dart';
import 'package:flutter_dragonball/features/characters/presentation/screens/home/character_home.screen.dart';
import 'package:go_router/go_router.dart';

/// @class AppRouterConfig
/// @description Defines and manages the main routing configuration of the application.
/// This class provides a centralized [GoRouter] setup used for navigation between screens.
///
/// @remarks
/// The router defines the app’s navigation structure using named routes.
/// It is initialized once and can be accessed globally throughout the app.
class AppRouterConfig {
  /// @variable router
  /// @description Main [GoRouter] instance containing the route definitions of the app.
  /// It specifies the initial location and the available routes, such as the home
  /// and character details screens.
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: AppRouterNames.home,
        path: '/',
        builder: (_, _) => const CharacterHomeScreen(),
      ),
      GoRoute(
        name: AppRouterNames.details,
        path: '/details',
        builder: (_, _) => const CharacterDetailScreen(),
      ),
    ],
  );
}
