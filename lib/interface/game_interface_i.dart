
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/test/globals.dart';
import 'package:algoritmo_minimax/test/minimax.dart';
import 'package:algoritmo_minimax/test/sketch.dart';

import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  /* Comienza el juego */
  void playAi(GameProvider provider) {
    provider.isPlaying = true;
    if(!provider.startFirst){
      bestMove();
    }
    runGameLoop(provider);
  }

  /* Reinicia el juego */
  void reset(GameProvider provider) {
    provider.resetGameUI();
    Globals.initGlobals();
  }

  /* Inicia el loop del juego */
  @override
  void runGameLoop(GameProvider provider) {

  }

}

