import 'package:algoritmo_minimax/provider/game_provider.dart';

abstract class GameInterface {
  void playAi(GameProvider provider);
  void reset(GameProvider provider);
  void autoplayLoop(GameProvider provider);
}