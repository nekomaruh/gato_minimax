import 'package:algoritmo_minimax/provider/game_controller.dart';

abstract class GameInterface {
  void playAi(GameController provider);
  void reset(GameController provider);
  void autoplayLoop(GameController provider);
}