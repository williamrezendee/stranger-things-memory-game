import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/controllers/game_controller.dart';
import 'package:flutter_memory_game_app/models/game_play.dart';
import 'package:flutter_memory_game_app/pages/game_page.dart';
import 'package:flutter_memory_game_app/theme.dart';
import 'package:provider/provider.dart';

class CardLevel extends StatelessWidget {
  final GamePlay gamePlay;

  const CardLevel({
    Key? key,
    required this.gamePlay
    }) : super(key: key);

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: ((context) => GamePage(gamePlay: gamePlay))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.mode == Mode.normal ? Colors.white : StrangerThingsTheme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.mode == Mode.normal ? Colors.transparent : StrangerThingsTheme.color.withOpacity(.6),
        ),
        child: Center(
          child: Text(
            gamePlay.level.toString(), 
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
  
  
}