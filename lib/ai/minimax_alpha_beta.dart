import 'dart:math';

import 'globals.dart';
import 'minimax.dart';

bestMoveAlphaBeta() {
  // Juega IA
  int bestScore = -9999999;
  var move;
  for (int i = 0; i < Globals.board.length; i++) {
    for (int j = 0; j < Globals.board.length; j++) {
      // Hay espacio?
      if (Globals.board[i][j] == '') {
        Globals.board[i][j] = Globals.ai;
        var score = minimaxAlphaBeta(Globals.board, Globals.maxDepth, -9999999, 9999999, false);
        Globals.board[i][j] = '';
        if (score > bestScore) {
          bestScore = score;
          move = [ i, j ];
        }
      }
    }
  }
  print('Mejor puntuacion Alpha-Beta $bestScore');
  Globals.board[move[0]][move[1]] = Globals.ai;
  Globals.currentPlayer = Globals.human;
  return move;
}


/* Algoritmo Minimax */
minimaxAlphaBeta(board, depth, alpha, beta, isMaximizing) {
  //Globals.printBoard();

  int val = evaluateBoard(depth);
  // Nodo terminal (ganar/perder/empate) o profundidad alcanzada
  if (val.abs() > 0 || depth == 0 || !anyMovesAvailable()) {
    return val;
  }

  if (isMaximizing) {
    int bestScore = -99999999;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        // Is the spot available?
        if (board[i][j] == '') {
          board[i][j] = Globals.ai;
          //int score = minimax(board, depth + 1, false);
          bestScore = max(bestScore, minimaxAlphaBeta(board, depth - 1, alpha, beta, false));
          board[i][j] = '';
          //bestScore = max(score, bestScore);
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = 99999999;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        // Hay espacio?
        if (board[i][j] == '') {
          board[i][j] = Globals.human;
          //var score = minimax(board, depth + 1, true);
          bestScore = min(bestScore, minimaxAlphaBeta(board, depth - 1, alpha, beta, true));
          board[i][j] = '';
          //bestScore = min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}