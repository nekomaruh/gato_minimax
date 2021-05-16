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
          actions: [
            IconButton(icon: Icon(CupertinoIcons.info), onPressed: () {})
          ],
        ),
        body: MediaQuery.of(context).size.aspectRatio > 1.36?
        _showLandscape(context):_showPortrait(context));
  }

  _showLandscape(BuildContext context) {
    return Row(
      children: [
        Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height-kToolbarHeight,
            child: Center(child: GameView())),
        Expanded(
          child: GamePanel(),
        )
      ],
    );
  }
  
  _showPortrait(BuildContext context){
    return ListView(
      children: [
        GameView(),
        Container(
            height: 800,
            child: GamePanel())
      ],
    );
  }

}

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> matrix = [0, 0, 0, 1, 0, 2, 2, 0, 0];
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
        });
  }
}

class GamePanel extends StatelessWidget {
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
              CupertinoButton.filled(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {},
                  child: Text('Iniciar')),
              CupertinoButton.filled(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {},
                  child: Text('Reiniciar')),
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
    final provider = Provider.of<PanelProvider>(context);
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
    final panelProvider = Provider.of<PanelProvider>(context);
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
}
