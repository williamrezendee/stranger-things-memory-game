import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memory_game_app/constants.dart';
import 'package:flutter_memory_game_app/game_settings.dart';
import 'package:flutter_memory_game_app/models/game_option.dart';
import 'package:flutter_memory_game_app/models/game_play.dart';
import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOption> gameCards = [];
  @observable
  int score = 0;
  @observable
  bool won = false;
  @observable
  bool lost = false;

  late GamePlay _gameplay;
  List<GameOption> _cards = [];
  List<Function> _cardsCallBack = [];
  int _hits = 0;
  int _pairsNumber = 0;

  @computed
  bool get completeGamePlay => (_cards.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gameplay = gamePlay;
    _hits = 0;
    _pairsNumber = (_gameplay.level / 2).round();
    won = false;
    lost = false;
    _resetScore();
    _generateCards();
  }
  
  _resetScore() {
    _gameplay.mode == Mode.normal
    ? score = 0
    : score = _gameplay.level;
  }
  
  _generateCards() {
    List<String> cardOptions = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOptions = cardOptions.sublist(0, _pairsNumber);
    gameCards = [... cardOptions, ... cardOptions]
      .map((option) => GameOption(option: option, matched: false, selected: false))
      .toList();
    gameCards.shuffle();
  }

  select(GameOption option, Function resetCard) async {
    option.selected = true;
    _cards.add(option);
    _cardsCallBack.add(resetCard);
    await _compareSelections();
  }

  _compareSelections() async {
    if (completeGamePlay) {
      if (_cards[0].option == _cards[1].option) { //Talvez precise corrigir a logica
        _hits++;
        _cards[0].matched = true;
        _cards[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _cards[i].selected = false;
            _cardsCallBack[i]();
          }
        });
      }

      _resetGamePlay();
      _updateScore();
      _checkGameResult();
    }
  }

  _resetGamePlay() {
    _cards = [];
    _cardsCallBack = [];
  }

  _updateScore() {
    _gameplay.mode == Mode.normal ? score++ : score --;
  }

  _checkGameResult() async {
    bool allMatched = _hits == _pairsNumber;
    if (_gameplay.mode == Mode.normal) {
      await _checkResultNormalMode(allMatched);
    } else {
      await _checkResultVecnaMode(allMatched);
    }
  }

  _checkResultNormalMode(bool allMatched) async{
    await Future.delayed(const Duration(seconds: 1),
    () => won = allMatched
    );
  }

  _checkResultVecnaMode(bool allMatched) async {
    if (isChanceDone()) {
      await Future.delayed(const Duration(microseconds: 400), () => lost = true);
    }
    if (allMatched && score >= 0) {
      await Future.delayed(const Duration(seconds: 1), () => won = allMatched);    }
  }
  
  bool isChanceDone() {
    return score < _pairsNumber - _hits;
  }

  restartGame() {
    startGame(gamePlay: _gameplay);
  }

  nextLeve() {
    int indexLevel = 0;

    if (_gameplay.level != GameSettings.levels.last) {
      indexLevel = GameSettings.levels.indexOf(_gameplay.level) + 1;
    }

    _gameplay.level = GameSettings.levels[indexLevel];
    startGame(gamePlay: _gameplay);
  }   
}