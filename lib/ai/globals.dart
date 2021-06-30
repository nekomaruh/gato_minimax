
import 'package:algoritmo_minimax/provider/game_controller.dart';

class Globals{
  static List<List<String>> board;
  static String ai;
  static String human;
  static String currentPlayer;
  static int maxDepth;
  static DateTime startTime;

  static initGlobals(){
    board = List.generate(3, (_) => List.filled(3,''));
    ai = 'X';
    human = 'O';
    currentPlayer = human;
    maxDepth = 12;
  }

  static reloadVariables(GameController provider){
    board = List.generate(Globals.board.length, (_) => List.filled(Globals.board.length,''));
    ai = 'X';
    human = 'O';
    currentPlayer = human;
  }

  static printBoard(){
    String boardString = '\n';
    for(int i=0; i<board.length; i++){
      for(int j=0; j<board.length; j++){
          if(board[i][j]=='') boardString += ' ';
          else boardString += board[i][j];
          if(j!=board.length-1) boardString += '|';
          else boardString += '\n';
      }
    }
    print(boardString);
  }

}