import 'dart:math';

import 'package:algoritmo_minimax/ai/sketch.dart';

import 'globals.dart';

bestMove() {
  // AI to make its turn
  int bestScore = -9999999;
  var move;
  for (int i = 0; i < Globals.board.length; i++) {
    for (int j = 0; j < Globals.board.length; j++) {
      // Is the spot available?
      if (Globals.board[i][j] == '') {
        Globals.board[i][j] = Globals.ai;
        var score = minimax(Globals.board, Globals.maxDepth, false);
        Globals.board[i][j] = '';
        if (score > bestScore) {
          bestScore = score;
          move = [ i, j ];
        }
      }
    }
  }
  print('Mejor puntuacion $bestScore');
  Globals.board[move[0]][move[1]] = Globals.ai;
  Globals.currentPlayer = Globals.human;
  return move;
}

var scores = {
  'X': 10,
  'O': -10,
  'tie': 0
};

minimax(board, depth, isMaximizing) {
  final sketch = Sketch();
  var result = sketch.checkWinner();
  if (result != null || depth == 0) {
    return scores[result];
  }

  if (isMaximizing) {
    int bestScore = -99999999;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        // Is the spot available?
        if (board[i][j] == '') {
          board[i][j] = Globals.ai;
          //int score = minimax(board, depth + 1, false);
          bestScore = max(bestScore, minimax(board, depth - 1, false));
          board[i][j] = '';
          //bestScore = max(score, bestScore);
        }
      }
    }
    return bestScore;
  } else {
    var bestScore = 99999999;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        // Is the spot available?
        if (board[i][j] == '') {
          board[i][j] = Globals.human;
          //var score = minimax(board, depth + 1, true);
          bestScore = min(bestScore, minimax(board, depth - 1, true));
          board[i][j] = '';
          //bestScore = min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}
