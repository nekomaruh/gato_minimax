import '../ai/globals.dart';

class Sketch {
  equals3(a, b, c) {
    return a == b && b == c && a != '';
  }

  bool equalsN(Set marks) {
    if(marks.length==1 && !marks.contains('')) return true;
    return false;
  }



  checkWinner() {
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

    int openSpots = 0;
    for (int i = 0; i < Globals.board.length; i++) {
      for (int j = 0; j < Globals.board.length; j++) {
        if (Globals.board[i][j] == '') {
          openSpots++;
        }
      }
    }

    if (winner == null && openSpots == 0) {
      return 'tie';
    } else {
      return winner;
    }

  }





/*
  checkWinner() {
    var winner;

    // horizontal
    for (int i = 0; i < 3; i++) {
      if (equals3(
          Globals.board[i][0], Globals.board[i][1], Globals.board[i][2])) {
        winner = Globals.board[i][0];
      }
    }

    // Vertical
    for (int i = 0; i < 3; i++) {
      if (equals3(
          Globals.board[0][i], Globals.board[1][i], Globals.board[2][i])) {
        winner = Globals.board[0][i];
      }
    }

    // Diagonal
    if (equals3(
        Globals.board[0][0], Globals.board[1][1], Globals.board[2][2])) {
      winner = Globals.board[0][0];
    }
    if (equals3(
        Globals.board[2][0], Globals.board[1][1], Globals.board[0][2])) {
      winner = Globals.board[2][0];
    }

    int openSpots = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (Globals.board[i][j] == '') {
          openSpots++;
        }
      }
    }

    if (winner == null && openSpots == 0) {
      return 'tie';
    } else {
      return winner;
    }
  }

 */






}
