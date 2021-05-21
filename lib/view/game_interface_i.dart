import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  /* Comienza el juego */
  void play(GameProvider provider) {
    provider.isPlaying = true;
    provider.reload = true;
  }

  /* Reinicia el juego */
  void reset(GameProvider provider) {
    provider.resetGame();
  }

}

