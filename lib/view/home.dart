import 'package:algoritmo_minimax/provider/panel_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gato - Algoritmo Minimax'),
        actions: [IconButton(icon: Icon(Icons.info_outline), onPressed: () {})],
      ),
      body: Row(
        children: [Expanded(child: GameView()), Expanded(child: GamePanel())],
      ),
    );
  }
}

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> matrix = [0, 0, 0, 1, 0, 2, 2, 0, 0];

    return Container(
      color: Colors.grey[100],
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: EdgeInsets.all(15),
          itemCount: matrix.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 0,
                color: matrix[index] == 0
                    ? Colors.blueGrey[200]
                    : matrix[index] == 1
                        ? Colors.blue[200]
                        : Colors.red[200],
                // ignore: unrelated_type_equality_checks
                child: Center(
                    child: matrix[index] == 0
                        ? Container()
                        : matrix[index] == 1
                            ? Icon(
                                Icons.close,
                                size: 60,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.circle,
                                size: 50,
                                color: Colors.red,
                              )));
          }),
    );
  }
}

class GamePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        Text(
          'Configurar nodos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        drop(context),
        SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CupertinoButton.filled(onPressed: () {}, child: Text('Jugar')),
            CupertinoButton.filled(onPressed: () {}, child: Text('Reiniciar')),
          ],
        ),
      ],
    );
  }
}

drop(BuildContext context) {
  List<int> d = [2, 3, 4, 5, 6, 7, 8, 9, 10];
  final panelProvider = Provider.of<PanelProvider>(context);
  return Row(
    children: [
      Text('Valor de K:     '),
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