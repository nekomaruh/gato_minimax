import 'package:algoritmo_minimax/provider/game_controller.dart';

abstract class GameInterface {
  playAi(GameController provider);
  reset(GameController provider);
  autoplayLoop(GameController provider);
}