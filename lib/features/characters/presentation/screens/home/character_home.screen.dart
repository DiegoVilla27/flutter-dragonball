import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiUrl = dotenv.env['ENV']!;

class CharacterHomeScreen extends StatelessWidget {
  const CharacterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Home'),
      ),
      body: Text('// TODO $apiUrl'),
    );
  }
}