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
              selectPlayer(context),
              selectK(context),
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
              _reloadBtn(context)
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
                child: Scrollbar(
                  child: ListView(
                    //reverse: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    children: [
                      Text('Jugador: [0,1]'),
                      Text(''),
                      Text('Máquina:'),
                      Text('Min nivel 2 -> h=2, h=3, h=-1'),
                      Text('Min nivel 2 -> h=2, h=3, h=-1'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectPlayer(BuildContext context) {
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

  selectK(BuildContext context) {
    List<int> d = [2, 3, 4, 5, 6, 7, 8, 9, 10];
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
                    child: new Text(value.toString()),
                  ))
              .toList(),
          onChanged: (v) => panelProvider.kValue = v,
        ),
      ],
    );
  }

  _playBtn(context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == false ? () => game.play(context) : null,
        child: Text('Iniciar'));
  }

  _playRandomBtn(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed: provider.isPlaying == false
            ? () => game.play(context, randomPlay: true)
            : null,
        child: Text('Random'));
  }

  _reloadBtn(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);
    return CupertinoButton.filled(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed:
            provider.isPlaying == true ? () => game.reload(context) : null,
        child: Text('Reiniciar'));
  }
}
