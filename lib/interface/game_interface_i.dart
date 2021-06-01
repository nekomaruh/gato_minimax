import 'dart:math';

import 'package:algoritmo_minimax/ai/minimax_alpha_beta.dart';
import 'package:algoritmo_minimax/ai/sketch.dart';
import 'package:algoritmo_minimax/provider/game_controller.dart';
import 'package:algoritmo_minimax/ai/globals.dart';
import 'package:algoritmo_minimax/ai/minimax.dart';

import 'game_interface.dart';

class GameInterfaceImpl implements GameInterface{
  /// La clase GameProvider es el controlador de la vista

  executeMove(GameController provider)  {
    List<int> move;
    if(provider.gameMode == 'Normal'){
      move = bestMove();
    }else{
      move = bestMoveAlphaBeta();
    }
    print(move);
    return move;
  }

  /* Comienza el juego */
  @override
  playAi(GameController provider) async {
    Globals.startTime = DateTime.now();
    provider.isPlaying = true;
    if(!provider.startFirst){
      var move = executeMove(provider);
      provider.isThinking = false;
      provider.addLog('Juega IA $move');
    }
    if(provider.autoPlay){
      print('autoplay');
      autoplayLoop(provider);
    }
  }

  /* Inicia el loop del juego en modo automático */
  @override
  void autoplayLoop(GameController provider) {
    final sketch = Sketch();
    var winner = sketch.checkWinner();
    while(winner==null){
      // Jugar random humano
      int x, y;
      do{
        Random random = new Random();
        x = random.nextInt(Globals.board.length);
        y = random.nextInt(Globals.board.length);
      }while(Globals.board[x][y]!='');
      provider.addLog('Juega Random: [$x,$y]');
      if (Globals.currentPlayer == Globals.human) {
        if (Globals.board[x][y] == '') {
          Globals.board[x][y] = Globals.human;
          Globals.currentPlayer = Globals.ai;
          final sketch = Sketch();
          winner = sketch.checkWinner();
          if(winner!=null) break;
          var move = executeMove(provider);
          provider.addLog('Juega IA: $move');
        }
      }
      final sketch = Sketch();
      winner = sketch.checkWinner();
    }
    provider.addLog('Gana $winner');
    final time = DateTime.now().difference(Globals.startTime);
    provider.addLog('Tiempo ${(time.inMilliseconds/1000)} segundos');
  }

  /* Reinicia el juego */
  void reset(GameController provider) {
    provider.resetGameUI();
    Globals.reloadVariables(provider);
  }



}

