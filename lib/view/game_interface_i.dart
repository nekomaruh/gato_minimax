import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  /* Comienza el juego */
  void play(BuildContext context, {bool randomPlay = false}) {
    final provider = Provider.of<GameProvider>(context, listen: false);
    provider.isPlaying = true;
    provider.reload = true;
  }

  /* Reinicia el juego */
  void reload(BuildContext context) {
    final provider = Provider.of<GameProvider>(context, listen: false);
    provider.resetGame();
  }

}

