import 'package:flutter_dragonball/core/router/router_names.dart';
import 'package:flutter_dragonball/features/characters/presentation/screens/details/character_detail.screen.dart';
import 'package:flutter_dragonball/features/characters/presentation/screens/home/character_home.screen.dart';
import 'package:go_router/go_router.dart';

/// [AppRouterConfig] is responsible for configuring the application's routing using GoRouter.
///
/// It defines the main navigation structure, specifying the initial route and all available routes.
/// Each route is associated with a name, a path, and a corresponding screen widget.
///
/// Usage:
/// Access the router via `AppRouterConfig.router` to integrate with your app's navigation.
class AppRouterConfig {
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
