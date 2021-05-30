import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/test/globals.dart';
import 'package:algoritmo_minimax/test/minimax.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  final GameInterface game;
  GameBoard(this.game);

  /* Ficha del jugador */
  final Icon playerIcon = Icon(
    Icons.close,
    size: 60,
    color: Colors.blue,
  );

  /* Ficha del enemigo */
  final Icon aiIcon = Icon(
    Icons.circle,
    size: 50,
    color: Colors.red,
  );

  /* Construye la vista completa */
  @override
  Widget build(BuildContext context) {
    final GameProvider provider = Provider.of<GameProvider>(context);
    return _buildBoard(provider);
  }

  /* Construye el tablero */
  GridView _buildBoard(GameProvider provider){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Globals.board.length,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: Globals.board.length * Globals.board.length,
        itemBuilder: (_,index) => _buildMark(provider, index));
  }

  /* Construye los casilleros del tablero */
  Widget _buildMark(GameProvider provider, int index) {
    int x = (index / Globals.board.length).floor();
    int y = (index % Globals.board.length);
    return GestureDetector(
      onTap: (){
        if (Globals.currentPlayer == Globals.human) {
          if (Globals.board[x][y] == '') {
            Globals.board[x][y] = Globals.human;
            Globals.currentPlayer = Globals.ai;
            bestMove();
          }
        }
      },
      child: Card(
          elevation: 0,
          color: setMarkColor(provider, x, y),
          child: Center(child: _setMarkIcon(provider, x, y))),
    );
  }

  /* Construye los iconos del tablero */
  Widget _setMarkIcon(GameProvider provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Container()
        : Globals.board[x][y] == 'X'
            ? playerIcon
            : aiIcon;
  }

  /* Construye el color de fondo del tablero */
  Color setMarkColor(GameProvider provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Colors.blueGrey[100]
        : Globals.board[x][y] == 'X'
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
