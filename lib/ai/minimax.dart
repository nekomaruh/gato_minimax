import 'dart:math';

import 'globals.dart';

List<int> bestMove() {
  // Juega IA
  int bestScore = -9999999;
  var move;
  for (int i = 0; i < Globals.board.length; i++) {
    for (int j = 0; j < Globals.board.length; j++) {
      // Hay espacio?
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

/* Puntajes */
var scores = {
  'X': 1,
  'O': -1,
  'empate': 0
};

/* Algoritmo Minimax */
minimax(board, depth, isMaximizing) {
  //Globals.printBoard();

  int val = evaluateBoard(depth);
  // Nodo terminal (ganar/perder/empate) o profundidad alcanzada
  if (val.abs() > 0 || depth == 0 || !anyMovesAvailable()) {
    return val;
  }

  /*
  final sketch = Sketch();
  var winer = sketch.checkWinner();
  if (winer != null || depth == 0) {
    return scores[winer];
  }
   */

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
    int bestScore = 99999999;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        // Hay espacio?
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


bool equalsN(Set marks) {
  if(marks.length==1 && !marks.contains('')) return true;
  return false;
}

anyMovesAvailable(){
  int openSpots = 0;
  for (int i = 0; i < Globals.board.length; i++) {
    for (int j = 0; j < Globals.board.length; j++) {
      if (Globals.board[i][j] == '') {
        openSpots++;
      }
    }
  }
  return openSpots > 0? true: false;
}


int evaluateBoard(int depth) {
  var winner;

  Set<String> winMarks = {};

  // Horizontal
  for (int x = 0; x < Globals.board.length; x++) {
    winMarks = {};
    for (int y = 0; y < Globals.board.length; y++){
      winMarks.add(Globals.board[x][y]);
    }
    if (equalsN(winMarks)) winner = Globals.board[x][0];
  }


  // Vertical
  for (int x = 0; x < Globals.board.length; x++) {
    winMarks = {};
    for (int y = 0; y < Globals.board.length; y++){
      winMarks.add(Globals.board[y][x]);
    }
    if (equalsN(winMarks)) winner = Globals.board[0][x];
  }

  // Diagonal
  winMarks = {};
  for(int i=0; i<Globals.board.length; i++)
    winMarks.add(Globals.board[i][i]);
  if(equalsN(winMarks)) winner = Globals.board[0][0];

  // Diagonal
  winMarks = {};
  for(int i=0; i<Globals.board.length; i++)
    winMarks.add(Globals.board[Globals.board.length-1-i][i]);
  if(equalsN(winMarks)) winner = Globals.board[Globals.board.length-1][0];

  if (winner == null) {
    return 0;
  } else {
    if(winner == 'X'){
      return 1 + depth;
    }
    if(winner == 'O'){
      return 1 - depth;
    }
    return 0;
  }

  static final MAX_DEPTH = 3;

  Minimax(){

  }

  static int miniMax(Board boad, int depth, bool isMax) {
    int boardVal;
  }


  static int evaluateBoard(Board board) {

  }
}