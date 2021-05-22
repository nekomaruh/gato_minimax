import 'package:algoritmo_minimax/model/board.dart';
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  /* Comienza el juego */
  void playAi(GameProvider provider) {
    provider.isPlaying = true;
    /*
    int[] move = MiniMaxCombined.getBestMove(board);
    int row = move[0];
    int col = move[1];
    board.placeMark(row, col);
    for (Node child : gameBoard.getChildren()) {
    if (GridPane.getRowIndex(child) == row
    && GridPane.getColumnIndex(child) == col) {
    Tile t = (Tile) child;
    t.update();
    return;
    }
    }
     */
  }

  /* Reinicia el juego */
  void reset(GameProvider provider) {
    provider.resetGameUI();
  }

  /* Inicia el loop del juego */
  @override
  void runGameLoop(GameProvider provider) {
    Board board = provider.board;
    if(board.isGameOver()){
      endGameLoop(provider);
    }else if (board.isCrossTurn()){
      playAi(provider);
    }
  }

  /* Finaliza el loop del juego */
  @override
  void endGameLoop(GameProvider provider) {
    // TODO: implement endGameLoop
  }

}

