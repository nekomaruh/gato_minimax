import 'globals.dart';

class Sketch {

  equals3(a, b, c) {
    return a == b && b == c && a != '';
  }

  checkWinner() {
    var winner;

    // horizontal
    for (int i = 0; i < 3; i++) {
      if (equals3(Globals.board[i][0], Globals.board[i][1], Globals.board[i][2])) {
        winner = Globals.board[i][0];
      }
    }

    // Vertical
    for (int i = 0; i < 3; i++) {
      if (equals3(Globals.board[0][i], Globals.board[1][i], Globals.board[2][i])) {
        winner = Globals.board[0][i];
      }
    }

    // Diagonal
    if (equals3(Globals.board[0][0], Globals.board[1][1], Globals.board[2][2])) {
      winner = Globals.board[0][0];
    }
    if (equals3(Globals.board[2][0], Globals.board[1][1], Globals.board[0][2])) {
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

}
