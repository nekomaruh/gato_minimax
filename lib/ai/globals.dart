import 'package:algoritmo_minimax/provider/game_controller.dart';

class Globals{
  static List<List<String>> board;
  static String ai;
  static String human;
  static String currentPlayer;
  static int maxDepth = 2;

  static initGlobals(){
    board = List.generate(3, (_) => List.filled(3,''));
    ai = 'X';
    human = 'O';
    currentPlayer = Globals.human;
  }

  static initGlobalsWithSize(GameController provider){
    board = List.generate(Globals.board.length, (_) => List.filled(Globals.board.length,''));
    ai = 'X';
    human = 'O';
    currentPlayer = Globals.human;
  }
}