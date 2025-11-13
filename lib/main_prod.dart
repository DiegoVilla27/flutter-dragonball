import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dragonball/core/di/di.dart';
import 'package:flutter_dragonball/core/router/config.router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized before async operations
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables (production configuration)
  await dotenv.load(fileName: ".env.prod");
  // Initialize dependency injection container
  await initDI();
  // Run the app within Riverpod’s ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DragonBallAPI',
      debugShowCheckedModeBanner: false,
      // Global app theme
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // Router configuration
      routerConfig: AppRouterConfig.router,
    );
  }
}
