import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/models/game_option.dart';
import 'package:flutter_memory_game_app/theme.dart';

class CardGame extends StatefulWidget {
  final Mode mode;
  final GameOption gameOption;

  const CardGame({
    Key? key,
    required this.mode,
    required this.gameOption,
    }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin{
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400)
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    animation.forward();
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage(widget.gameOption.option);
    } else {
      return widget.mode == Mode.normal
        ? const AssetImage('assets/images/Stranger-Things-Normal-Card.png')
        : const AssetImage('assets/images/Stranger-Things-Vecna-Card.png');
    }
  }

  String getCharacter(List<String> list) {
    var imageToShow = list[Random().nextInt(list.length)];
    return imageToShow.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, 
      builder: (BuildContext context, _) {
        final angle = animation.value * pi;
        final transform = Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(angle);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.mode == Mode.normal ? Colors.white : StrangerThingsTheme.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angle),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}