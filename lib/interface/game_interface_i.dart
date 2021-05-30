
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/test/minimax.dart';
import 'package:algoritmo_minimax/test/sketch.dart';

import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  /* Comienza el juego */
  void playAi(GameProvider provider) {
    provider.isPlaying = true;

    bestMove();
    runGameLoop(provider);

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
    /*
    Board board = provider.board;
    if(board.isGameOver()){
      endGameLoop(provider);
    }else if (board.isCrossTurn()){
      playAi(provider);
    }
     */


    /*
    final sketch = Sketch();
    var winner = sketch.checkWinner();

    while(winner!= null){

      // Chequear movimientos disponibles



      var resultP = createP('');
      resultP.style('font-size', '32pt');
      if (winner == 'tie') {
        resultP.html('Tie!');
      } else {
        resultP.html(`${result} wins!`);
      }


    }

     */




  }

  /* Finaliza el loop del juego */
  @override
  void endGameLoop(GameProvider provider) {
    // TODO: implement endGameLoop
  }

}

