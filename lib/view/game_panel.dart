import 'package:algoritmo_minimax/provider/game_provider.dart';
import 'package:algoritmo_minimax/view/game_interface.dart';
import 'package:algoritmo_minimax/view/game_interface_i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_interface.dart';

class GamePanel extends StatelessWidget {
  final GameInterface game = GameInterfaceImpl();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configurar Juego',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 10,
            //runSpacing: 15,
            children: [
              _selectPlayer(context),
              _selectK(context),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: [
              _playBtn(context),
              _playRandomBtn(context),
              _resetBtn(context)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.grey[200],
                child: Scrollbar(child: _logList(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Jugador que comienza primero */
  Widget _selectPlayer(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Empezar primero:',
          ),
          SizedBox(
            width: 10,
          ),
          Checkbox(
              value: provider.firstPlayer,
              onChanged: (v) => provider.firstPlayer = v)
        ],
      ),
    );
  }

  /* Lista de selección de valor K */
  Widget _selectK(BuildContext context) {
    List<int> d = [1, 2, 3];
    final panelProvider = Provider.of<GameProvider>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Valor de K:'),
        SizedBox(
          width: 10,
        ),
        DropdownButton<int>(
          value: panelProvider.kValue,
          items: d
              .map((int value) => DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  ))
              .toList(),
          onChanged: (v) => panelProvider.kValue = v,
        ),
      ],
    );
  }

  /* Boton de jugar */
  CupertinoButton _playBtn(context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == false ? () => game.play(context) : null,
        child: Text('Iniciar'));
  }

  /* Boton de jugar aleatorio */
  CupertinoButton _playRandomBtn(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed: provider.isPlaying == false
            ? () => game.play(context, randomPlay: true)
            : null,
        child: Text('Random'));
  }

  /* Boton de reiniciar */
  CupertinoButton _resetBtn(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == true ? () => game.reload(context) : null,
        child: Text('Reiniciar'));
  }

  /* Lista de logs que muestra el juego */
  ListView _logList(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(10),
      itemCount: provider.logs.length,
      itemBuilder: (context, i) => Text('${provider.logs[i]}'),
    );
  }
}
