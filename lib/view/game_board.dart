import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/model/mark.dart';
import 'package:algoritmo_minimax/provider/game_provider.dart';
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
          crossAxisCount: provider.board.board.length,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: provider.board.board.length * provider.board.board.length,
        itemBuilder: (_,index) => _buildMark(provider, index));
  }

  /* Construye los casilleros del tablero */
  Widget _buildMark(GameProvider provider, int index) {
    int x = (index / provider.board.board.length).floor();
    int y = (index % provider.board.board.length);
    return Card(
        elevation: 0,
        color: setMarkColor(provider, x, y),
        child: Center(child: _setMarkIcon(provider, x, y)));
  }

  /* Construye los iconos del tablero */
  Widget _setMarkIcon(GameProvider provider, int x, int y) {
    return provider.board.board[x][y] == Mark.BLANK
        ? Container()
        : provider.board.board[x][y] == Mark.X
            ? playerIcon
            : aiIcon;
  }

  /* Construye el color de fondo del tablero */
  Color setMarkColor(GameProvider provider, int x, int y) {
    return provider.board.board[x][y] == Mark.BLANK
        ? Colors.blueGrey[100]
        : provider.board.board[x][y] == Mark.X
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
