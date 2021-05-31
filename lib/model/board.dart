import 'mark.dart';

class Board {
  static int BOARD_WITH = 3;
  List<List<Mark>> board;
  Mark winningMark;
  bool tie;
  bool crossTurn, gameOver;
  int availableMoves = BOARD_WITH*BOARD_WITH;

  Board() {
    crossTurn = true;
    tie = false;
    gameOver = false;
    winningMark = Mark.BLANK;
    initialisedBoard();
  }

  void initialisedBoard() {
    board = List.generate(BOARD_WITH, (_) => List.filled(BOARD_WITH,Mark.BLANK));
  }

  /* El jugador marca un espacio dada las cordenadas de
  filas y columnas si es posible luego, cambia al otro jugador
  chequea si la jugada fue una vistoria y devuelve true o false
  si la jugada se logro con exito
   */
  bool placeMark(int row, int col) {
    if(row < 0 || row >= BOARD_WITH || col < 0 || col >= BOARD_WITH
    || isTileMarked(row, col) || gameOver){
      return false;
    }
    availableMoves--;
    board[row][col] = crossTurn ? Mark.X : Mark.O ;
    togglePlayer();
    checkWin(row, col);
    return true;
  }

  void checkWin(int row, int col){
    //Check row for winner
    if(board[row][0] == board[row][1] && board[row][1] == board[row][2]){
      gameOver = true;
      winningMark = getMarkAt(row, 0);
      return;
    }
    //check col for winner
    else if(board[0][col] == board[1][col] && board[1][col] == board[2][col]) {
      gameOver = true;
      winningMark = getMarkAt(row, 0);
      return;
    }
    //check first diagonal
    else if (board[0][0] == board[1][1] && board[1][1] == board[2][2]){
      gameOver = true;
      winningMark = getMarkAt(row, 0);
      return;
    }
    //check second diagonal
    else if (board[2][0] == board[1][1] && board[1][1] == board[0][2]){
      gameOver = true;
      winningMark = getMarkAt(row, 0);
      return;
    }
    //Check if is a Tie
    else if (!anyMovesAvailable()){
      gameOver = true;
      tie = true;
    }
  }

  setMarkAt(int row, int col, Mark newMark){
    board[row][col] = newMark;
  }

  Mark getMarkAt(int row, int col){
    return board[row][col];
  }

  bool isTileMarked(int row, int col){
    return !(board[row][col] == Mark.BLANK);
  }

  void togglePlayer(){
    crossTurn = !crossTurn;
  }

  bool anyMovesAvailable(){
    return availableMoves > 0;
  }

  bool isCrossTurn(){
    return crossTurn;
  }

  bool isGameOver(){
    return gameOver;
  }

  Mark getWinningMark(){
    return winningMark;
  }

  int getWidth(){
    return BOARD_WITH;
  }

}

