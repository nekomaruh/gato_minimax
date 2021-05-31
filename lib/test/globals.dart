class Globals{
  static List<List<String>> board;
  static int w;
  static int h;
  static String ai;
  static String human;
  static String currentPlayer;

  static initGlobals(){
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    w = 3; // = width / 3;
    h = 3; // = height / 3;
    ai = 'X';
    human = 'O';
    currentPlayer = Globals.human;
  }
}