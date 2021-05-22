import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/interface/game_interface_i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_config.dart';
import 'game_board.dart';

class Game extends StatelessWidget {

  /// AQUI PODEMOS AGREGAR A CLASE DE PRUEBA
  final GameInterface game = new GameInterfaceImpl();

  /* Construye toda la vista de la aplicacion */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gato - Algoritmo Minimax'),
          actions: [
            Tooltip(
                message: '¿Como Jugar?',
                child: IconButton(
                    icon: Icon(CupertinoIcons.info), onPressed: () {}))
          ],
        ),
        body: MediaQuery.of(context).size.aspectRatio > 1.36
            ? _showLandscape(context)
            : _showPortrait(context));
  }

  /* Vista en horizontal */
  Widget _showLandscape(BuildContext context) {
    return Row(
      children: [
        Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Center(child: GameBoard(game))),
        Expanded(
          child: Container(child: GameConfig(game)),
        )
      ],
    );
  }

  /* Vista en vertical */
  Widget _showPortrait(BuildContext context) {
    return ListView(
      children: [
        GameBoard(game),
        Container(height: 800, child: GameConfig(game))
      ],
    );
  }
}
