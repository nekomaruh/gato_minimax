import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/interface/game_interface.dart';
import 'package:algoritmo_minimax/interface/game_interface_i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interface/game_interface.dart';

class GameConfig extends StatelessWidget {
  final GameInterface game;
  GameConfig(this.game);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
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
            children: [_playBtn(provider), _resetBtn(provider)],
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  color: Colors.grey[200],
                ),
                Scrollbar(child: _logList(provider)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* Empezar primero */
  Widget _startFirst(GameProvider provider) {
    return CheckboxListTile(
      title: Text(
        'Empezar primero',
      ),
      value: provider.firstPlayer,
      onChanged: provider.isPlaying ? null : (v) => provider.firstPlayer = v,
    );
  }

  /* Jugar automaticamente */
  CheckboxListTile _autoPlay(GameProvider provider) {
    return CheckboxListTile(
        value: provider.autoPlay,
        title: Text('Jugar automáticamente'),
        onChanged: provider.isPlaying ? null : (v) => provider.autoPlay = v);
  }

  /* Tamaño de tablero */
  ListTile _boardSize(GameProvider provider) {
    List<int> d = [2, 3, 4, 5];
    return ListTile(
        enabled: !provider.isPlaying,
        title: Row(
          children: [
            Expanded(child: Text('Tamaño del tablero')),
            DropdownButton<int>(
                underline: Container(),
                value: provider.boardSize,
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

  /* Seleccionar K */
  ListTile _selectK(GameProvider provider) {
    List<int> d = [1, 2, 3];
    return ListTile(
      enabled: !provider.isPlaying,
      title: Row(
        children: [
          Expanded(child: Text('Valor de K')),
          DropdownButton<int>(
            value: provider.kValue,
            underline: SizedBox(),
            items: d
                .map((int value) => DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    ))
                .toList(),
            onChanged: provider.isPlaying ? null : (v) => provider.kValue = v,
          ),
        ],
      ),
    );
  }

  /* Boton de jugar */
  CupertinoButton _playBtn(GameProvider provider) {
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == false ? () => game.play(provider) : null,
        child: Text('Iniciar'));
  }

  /* Boton de reiniciar */
  CupertinoButton _resetBtn(GameProvider provider) {
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == true ? () => game.reset(provider) : null,
        child: Text('Reiniciar'));
  }

  /* Lista de logs que muestra el juego */
  ListView _logList(GameProvider provider) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: provider.logs.length,
      itemBuilder: (context, i) => Text('${provider.logs[i]}'),
    );
  }

  ListTile _gameMode(GameProvider provider) {
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
}
