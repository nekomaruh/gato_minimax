import 'package:algoritmo_minimax/interface/game_interface.dart';
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
          crossAxisCount: provider.matrix.length,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: provider.matrix.length * provider.matrix.length,
        itemBuilder: (_,index) => _buildMark(provider, index));
  }

  /* Construye los casilleros del tablero */
  Widget _buildMark(GameProvider provider, int index) {
    int x = (index / provider.matrix.length).floor();
    int y = (index % provider.matrix.length);
    return Card(
        elevation: 0,
        color: setMarkColor(provider, x, y),
        child: Center(child: _setMarkIcon(provider, x, y)));
  }

  /* Construye los iconos del tablero */
  Widget _setMarkIcon(GameProvider provider, int x, int y) {
    return provider.matrix[x][y] == 0
        ? Container()
        : provider.matrix[x][y] == 1
            ? playerIcon
            : aiIcon;
  }

  /* Construye el color de fondo del tablero */
  static Color setMarkColor(GameProvider provider, int x, int y) {
    return provider.matrix[x][y] == 0
        ? Colors.blueGrey[100]
        : provider.matrix[x][y] == 1
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
