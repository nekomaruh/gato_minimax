class Globals{
  static List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  static int w = 3; // = width / 3;
  static int h = 3; // = height / 3;

  static String ai = 'X';
  static String human = 'O';
  static String currentPlayer = Globals.human;
}