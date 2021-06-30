import 'board.dart';

class Console {

  Board board;

  Console(){
    this.board = new Board();
  }

  play(){
    print(this.board);
  }

}