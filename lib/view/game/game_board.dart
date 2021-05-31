import 'package:algoritmo_minimax/ai/minimax_alpha_beta.dart';
import 'package:algoritmo_minimax/ai/sketch.dart';
import 'package:algoritmo_minimax/helpers/alert.dart';
import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/provider/game_controller.dart';
import 'package:algoritmo_minimax/ai/globals.dart';
import 'package:algoritmo_minimax/ai/minimax.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {
  final GameInterface game;
  GameBoard(this.game);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final Icon playerIcon = Icon(
    Icons.close,
    size: 60,
    color: Colors.blue,
  );

  final Icon aiIcon = Icon(
    Icons.circle,
    size: 50,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    final GameController provider = Provider.of<GameController>(context);
    return _buildBoard(provider);
  }

  GridView _buildBoard(GameController provider) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Globals.board.length,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        itemCount: Globals.board.length * Globals.board.length,
        itemBuilder: (_, index) => _buildMark(provider, index));
  }

  Widget _buildMark(GameController provider, int index) {
    int x = (index / Globals.board.length).floor();
    int y = (index % Globals.board.length);
    return GestureDetector(
      onTap: () {
        provider.addLog('Juega humano: [$x,$y]');
        if (provider.isPlaying) {
          final sketch = Sketch();
          var winner = sketch.checkWinner();
          if (winner == null) {
            if (Globals.currentPlayer == Globals.human) {
              if (Globals.board[x][y] == '') {
                Globals.board[x][y] = Globals.human;
                Globals.currentPlayer = Globals.ai;
                final sketch = Sketch();
                var winner = sketch.checkWinner();
                provider.addLog('Ganador: ${winner ?? 'Ninguno'}');
                if (winner != null) {
                  showAlert(
                      context,
                      'Partida Terminada',
                      winner == 'empate'
                          ? 'Empate'
                          : winner == 'X'
                          ? 'Ha ganado IA'
                          : 'Ha ganado humano');
                  return;
                }
                var move;
                if(provider.gameMode == 'Normal'){
                  move = bestMove();
                }else{
                  move = bestMoveAlphaBeta();
                }
                provider.addLog('Juega IA: $move');
              }
            }
            setState(() {});
            final sketch = Sketch();
            var winner = sketch.checkWinner();
            provider.addLog('Ganador: ${winner ?? 'Ninguno'}');
            if (winner != null) {
              showAlert(
                  context,
                  'Partida Terminada',
                  winner == 'empate'
                      ? 'Empate'
                      : winner == 'X'
                          ? 'Ha ganado IA'
                          : 'Ha ganado humano');
            }
          }
        }
      },
      child: Card(
          elevation: 0,
          color: setMarkColor(provider, x, y),
          child: Center(child: _setMarkIcon(provider, x, y))),
    );
  }

  Widget _setMarkIcon(GameController provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Container()
        : Globals.board[x][y] == 'X'
            ? playerIcon
            : aiIcon;
  }

  Color setMarkColor(GameController provider, int x, int y) {
    return Globals.board[x][y] == ''
        ? Colors.blueGrey[100]
        : Globals.board[x][y] == 'X'
            ? Colors.blue[200]
            : Colors.red[200];
  }
}
