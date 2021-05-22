import 'package:algoritmo_minimax/ai/minimax.dart';
import 'package:algoritmo_minimax/model/board.dart';
import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista
  static Board board;

  /* Comienza el juego */
  void play(GameProvider provider) {
    provider.isPlaying = true;
  }

  /* Reinicia el juego */
  void reset(GameProvider provider) {
    provider.resetGame();
  }

  @override
  void playAi(GameProvider provider) {

  }

}

