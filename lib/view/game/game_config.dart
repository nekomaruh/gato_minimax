import 'package:algoritmo_minimax/provider/game_controller.dart';
import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/ai/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../interface/game_interface.dart';

class GameConfig extends StatefulWidget {
  final GameInterface game;
  GameConfig(this.game);

  @override
  _GameConfigState createState() => _GameConfigState();
}

class _GameConfigState extends State<GameConfig> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameController>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          _startFirst(provider),
          Divider(),
          _autoPlay(provider),
          Divider(),
          _boardSize(provider),
          Divider(),
          _selectK(provider),
          Divider(),
          _gameMode(provider),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 10,
            runSpacing: 10,
            children: [_thinking(provider), _playBtn(provider), _resetBtn(provider)],
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: provider.logs.length == 0
                  ? Colors.transparent
                  : Colors.grey[200],
              child: Scrollbar(child: _logList(provider)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _startFirst(GameController provider) {
    return CheckboxListTile(
      title: Text(
        'Empezar primero',
      ),
      value: provider.startFirst,
      onChanged: provider.isPlaying ? null : (v) => provider.startFirst = v,
    );
  }

  CheckboxListTile _autoPlay(GameController provider) {
    return CheckboxListTile(
        value: provider.autoPlay,
        title: Text('Jugar automáticamente'),
        onChanged: provider.isPlaying ? null : (v) => provider.autoPlay = v);
  }

  ListTile _boardSize(GameController provider) {
    List<int> d = [2, 3, 4, 5];
    return ListTile(
        enabled: !provider.isPlaying,
        title: Row(
          children: [
            Expanded(child: Text('Tamaño del tablero')),
            DropdownButton<int>(
                underline: Container(),
                value: Globals.board.length,
                items: d
                    .map((int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value x $value'),
                        ))
                    .toList(),
                onChanged: provider.isPlaying
                    ? null
                    : (v) => provider.changeMatrixSize(v)),
          ],
        ));
  }

  ListTile _selectK(GameController provider) {
    List<int> d = [2, 3, 4, 5, 6];
    return ListTile(
      enabled: !provider.isPlaying,
      title: Row(
        children: [
          Expanded(child: Text('Valor de K (dificultad)')),
          DropdownButton<int>(
            value: Globals.maxDepth,
            underline: SizedBox(),
            items: d
                .map((int value) => DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    ))
                .toList(),
            onChanged:
                provider.isPlaying ? null : (v) => provider.setMaxDepth(v),
          ),
        ],
      ),
    );
  }

  CupertinoButton _playBtn(GameController provider) {
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed: provider.isPlaying == false
            ? () async {
                provider.isThinking = true;
                await widget.game.playAi(provider);
              }
            : null,
        child: Text('Iniciar'));
  }

  CupertinoButton _resetBtn(GameController provider) {
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed: provider.isPlaying == true
            ? () => widget.game.reset(provider)
            : null,
        child: Text('Reiniciar'));
  }

  ListView _logList(GameController provider) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: provider.logs.length,
      itemBuilder: (context, i) => Text('${i + 1}. ${provider.logs[i]}'),
    );
  }

  ListTile _gameMode(GameController provider) {
    List<String> mode = ['Normal', 'Alpha-Beta'];
    return ListTile(
      enabled: !provider.isPlaying,
      title: Row(
        children: [
          Expanded(child: Text('Modo de Juego')),
          DropdownButton<String>(
            value: provider.gameMode,
            underline: SizedBox(),
            items: mode
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: provider.isPlaying ? null : (v) => provider.gameMode = v,
          ),
        ],
      ),
    );
  }

  _thinking(GameController provider) {
    return provider.isThinking
        ? Image(
      image: AssetImage('img/thinking.gif'),
      width: 40,
      height: 40,
    )
        : Container();
  }
}
