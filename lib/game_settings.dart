class GameSettings {
  static const levels = [6, 12, 16, 24, 30, 36, 42];

  static const cardOptions = [
    "assets/images/characters/Argyle_S04.png",
    "assets/images/characters/Dustin_Henderson_S04.png",
    "assets/images/characters/Eddie_Munson_S04.png",
    "assets/images/characters/Eleven_S04.png",
    "assets/images/characters/Erica_Sinclair_S04.png",
    "assets/images/characters/Jim_Hopper_S04.png",
    "assets/images/characters/Jonathan_Byers_S04.png",
    "assets/images/characters/Joyce_Byers_S04.png",
    "assets/images/characters/Karen_Wheeler_S04.png",
    "assets/images/characters/Lucas_Sinclair_S04.png",
    "assets/images/characters/Martin_Brenner_S04.png",
    "assets/images/characters/Max_Mayfield_S04.png",
    "assets/images/characters/Mike_Wheeler_S04.png",
    "assets/images/characters/Murray_Bauman_S04.png",
    "assets/images/characters/Nancy_Wheeler_S04.png",
    "assets/images/characters/Robin_Buckley_S04.png",
    "assets/images/characters/Sam_Owens_S04.png",
    "assets/images/characters/Steve_Harrington_S04.png",
    "assets/images/characters/Vecna_S04.png",
    "assets/images/characters/Will_Byers_S04.png"
  ];

  static gameBoardAxisCount(int level) {
    if (level < 12) {
      return 2;
    } else if (level < 16) {
      return 3;
    } else if (level < 30) {
      return 4;
    } else if (level < 36){
      return 5;
    } else {
      return 6;
    }
  }
}