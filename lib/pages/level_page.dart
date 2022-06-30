import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/game_settings.dart';
import 'package:flutter_memory_game_app/models/game_play.dart';
import 'package:flutter_memory_game_app/widgets/card_level.dart';

class Level extends StatelessWidget {
  final Mode mode;

  const Level({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levels = GameSettings.levels.map((level) => CardLevel(gamePlay: GamePlay(mode: mode, level: level))).toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: levels,
        ),
      ),
    );
  }
}