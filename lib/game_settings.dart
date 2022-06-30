class GameSettings {
  static const levels = [6, 12, 16, 24, 30, 36, 42];

  static const cardOptions = [
    "Argyle",
    "Dustin_Henderson",
    "Eddie_Munson",
    "Eleven",
    "Erica_Sinclair",
    "Jim_Hopper",
    "Jonathan_Byers",
    "Joyce_Byers",
    "Karen_Wheeler",
    "Lucas_Sinclair",
    "Martin_Brenner",
    "Max_Mayfield",
    "Mike_Wheeler",
    "Murray_Bauman",
    "Nancy_Wheeler",
    "Robin_Buckley",
    "Sam_Owens",
    "Steve_Harrington",
    "Vecna",
    "Will_Byers"
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