import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_panel.dart';
import 'game_board.dart';

class Home extends StatelessWidget {

  /// AQUI PODEMOS AGREGAR A CLASE DE PRUEBA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gato - Algoritmo Minimax'),
          actions: [
            IconButton(icon: Icon(CupertinoIcons.info), onPressed: () {})
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
            child: Center(child: GameView())),
        Expanded(
          child: GamePanel(),
        )
      ],
    );
  }

  /* Vista en vertical */
  Widget _showPortrait(BuildContext context) {
    return ListView(
      children: [GameView(), Container(height: 800, child: GamePanel())],
    );
  }
}
