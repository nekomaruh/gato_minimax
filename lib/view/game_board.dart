import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  final List<List<int>> matrix = [
    [0, 0, 0],
    [1, 0, 2],
    [2, 0, 0]
  ];

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
  Widget build(BuildContext context) => _buildBoard();

  /* Construye el tablero */
  GridView _buildBoard(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: matrix.length * matrix.length,
        itemBuilder: _buildMark);
  }

  /* Construye los casilleros del tablero */
  Widget _buildMark(BuildContext context, int index) {
    int x = (index / matrix.length).floor();
    int y = (index % matrix.length);
    return Card(
        elevation: 0,
        color: _setMarkColor(x, y),
        child: Center(child: _setMarkIcon(x, y)));
  }

  /* Construye los iconos del tablero */
  Widget _setMarkIcon(int x, int y) {
    return matrix[x][y] == 0
        ? Container()
        : matrix[x][y] == 1
            ? playerIcon
            : aiIcon;
  }

  /* Construye el color de fondo del tablero */
  Color _setMarkColor(int x, int y) {
    return matrix[x][y] == 0
        ? Colors.blueGrey[200]
        : matrix[x][y] == 1
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
