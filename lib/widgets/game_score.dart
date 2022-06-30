import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/controllers/game_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GameScore extends StatelessWidget {
  final Mode mode;

  const GameScore({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.chevron_left),
        ),
        Image.asset('assets/images/Stranger-Things-Logo.png', width: 100, height: 100),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(mode == Mode.normal ? Icons.touch_app_rounded : Icons.my_location),
            const SizedBox(width: 5),
            Observer(
              builder: (_) => Text(
                controller.score.toString(), 
                style: const TextStyle(fontSize: 25))
            ),
          ],
        ),
      ],
    );
  }
}