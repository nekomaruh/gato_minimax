import 'package:algoritmo_minimax/helpers/alert.dart';
import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/test/globals.dart';
import 'package:algoritmo_minimax/test/minimax.dart';
import 'package:algoritmo_minimax/test/sketch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {
  final GameInterface game;
  GameBoard(this.game);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final Icon playerIcon = Icon(
    Icons.close,
    size: 60,
    color: Colors.blue,
  );

  final Icon aiIcon = Icon(
    Icons.circle,
    size: 50,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    final GameProvider provider = Provider.of<GameProvider>(context);
    return _buildBoard(provider);
  }

  GridView _buildBoard(GameProvider provider) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Globals.board.length,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: Globals.board.length * Globals.board.length,
        itemBuilder: (_, index) => _buildMark(provider, index));
  }

  Widget _buildMark(GameProvider provider, int index) {
    int x = (index / Globals.board.length).floor();
    int y = (index % Globals.board.length);
    return GestureDetector(
      onTap: () {
        if(provider.isPlaying){
          final sketch = Sketch();
          var winner = sketch.checkWinner();
          if (winner == null) {
            if (Globals.currentPlayer == Globals.human) {
              if (Globals.board[x][y] == '') {
                Globals.board[x][y] = Globals.human;
                Globals.currentPlayer = Globals.ai;
                bestMove();
              }
            }
            setState(() {});
            final sketch = Sketch();
            var winner = sketch.checkWinner();
            if (winner != null) {
              showAlert(context, 'Partida Terminada', 'Ha ganado $winner');
            }
          }
        }
      },
      child: Card(
          elevation: 0,
          color: setMarkColor(provider, x, y),
          child: Center(child: _setMarkIcon(provider, x, y))),
    );
  }

  Widget _setMarkIcon(GameProvider provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Container()
        : Globals.board[x][y] == 'X'
            ? playerIcon
            : aiIcon;
  }

  Color setMarkColor(GameProvider provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Colors.blueGrey[100]
        : Globals.board[x][y] == 'X'
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
