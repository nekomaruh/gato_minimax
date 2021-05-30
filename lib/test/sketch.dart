import 'globals.dart';
import 'minimax.dart';

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

  /*
  function draw() {
    background(255);
    strokeWeight(4);

    line(w, 0, w, height);
    line(w * 2, 0, w * 2, height);
    line(0, h, width, h);
    line(0, h * 2, width, h * 2);

    for (let j = 0; j < 3; j++) {
      for (let i = 0; i < 3; i++) {
        let x = w * i + w / 2;
        let y = h * j + h / 2;
        let spot = board[i][j];
        textSize(32);
        let r = w / 4;
        if (spot == human) {
          noFill();
          ellipse(x, y, r * 2);
        } else if (spot == ai) {
          line(x - r, y - r, x + r, y + r);
          line(x + r, y - r, x - r, y + r);
        }
      }
    }

    let result = checkWinner();
    if (result != null) {
      noLoop();
      let resultP = createP('');
      resultP.style('font-size', '32pt');
      if (result == 'tie') {
        resultP.html('Tie!');
      } else {
        resultP.html(`${result} wins!`);
      }
    }
  }

   */
}
