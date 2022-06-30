import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/pages/level_page.dart';
import 'package:flutter_memory_game_app/theme.dart';
import 'package:flutter_memory_game_app/widgets/logo.dart';
import 'package:flutter_memory_game_app/widgets/records.dart';
import 'package:flutter_memory_game_app/widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  selectLevel(Mode mode, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => Level(mode: mode))
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Normal Mode',
              color: Colors.white, 
              action: () => selectLevel(Mode.normal, context),
            ),
            StartButton(
              title: 'Vecna Mode',
              color: StrangerThingsTheme.color,
              action: () => selectLevel(Mode.vecna, context)
            ),
            const SizedBox(height: 20),
            const Records(),
          ],
        ),
      ),
    );
  }
}