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
}