import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/controllers/game_controller.dart';
import 'package:flutter_memory_game_app/game_settings.dart';
import 'package:flutter_memory_game_app/models/game_option.dart';
import 'package:flutter_memory_game_app/models/game_play.dart';
import 'package:flutter_memory_game_app/pages/feedback_page.dart';
import 'package:flutter_memory_game_app/widgets/card_game.dart';
import 'package:flutter_memory_game_app/widgets/game_score.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({
    Key? key,
    required this.gamePlay,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScore(mode: gamePlay.mode)
      ),
      body: Observer(
        builder: (_) {
          if (controller.won) {
            return const FeedbackGame(result: Result.approved);
          } else if (controller.lost) {
            return const FeedbackGame(result: Result.eliminated);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.level),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24),
                children: controller.gameCards.map((gameOption) => CardGame(mode: gamePlay.mode, gameOption: gameOption)).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}