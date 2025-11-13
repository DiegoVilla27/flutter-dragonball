import 'package:flutter/material.dart';
import 'package:flutter_dragonball/features/characters/presentation/providers/characters/characters.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterHomeScreen extends ConsumerWidget {
  const CharacterHomeScreen({super.key});

  @override
  Widget build(_, WidgetRef ref) {
    final charactersProv = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Character Home')),
      body: charactersProv.when(
        data: (characters) {
          if (characters.items.isEmpty) {
            return const Center(child: Text('No characters found'));
          }
          return ListView.builder(
            itemCount: characters.meta.itemCount,
            itemBuilder: (_, index) {
              final character = characters.items[index];
              return ListTile(
                title: Text(character.name),
                subtitle: Text(character.description),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
