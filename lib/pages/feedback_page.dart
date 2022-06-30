import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/controllers/game_controller.dart';
import 'package:flutter_memory_game_app/widgets/start_button.dart';
import 'package:provider/provider.dart';

class FeedbackGame extends StatelessWidget {
  final Result result;

  const FeedbackGame({Key? key, required this.result}) : super(key: key);

  String getResult() {
    return result == Result.approved ? 'Congrats' : 'Try Again';
  }
  @override
  Widget build(BuildContext context) {
    final controller = context.read<GameController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${getResult().toUpperCase()}!',
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('TODO'),
          ),
          result == Result.eliminated
            ? StartButton(
              title: 'Try Again', 
              color: Colors.white, 
              action: () => controller.restartGame(),
            )
            : StartButton(
              title: 'Next Level',
              color: Colors.white,
              action: () => controller.nextLeve(),
            ),
        ],
      ),
    );
  }
}