import 'package:algoritmo_minimax/provider/game_provider.dart';

class Globals{
  static List<List<String>> board;
  static String ai;
  static String human;
  static String currentPlayer;

  static initGlobals(){
    board = List.generate(3, (_) => List.filled(3,''));
    ai = 'X';
    human = 'O';
    currentPlayer = Globals.human;
  }

  static initGlobalsWithSize(GameProvider provider){
    ai = 'X';
    human = 'O';
    currentPlayer = Globals.human;
  }
}