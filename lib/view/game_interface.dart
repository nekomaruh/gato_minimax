import 'package:algoritmo_minimax/provider/game_provider.dart';

abstract class GameInterface {
  void play(GameProvider provider);
  void reset(GameProvider provider);
}