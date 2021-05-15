import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gato - Algoritmo Minimax'),
      actions: [
        IconButton(icon: Icon(Icons.info_outline), onPressed: (){})
      ],),
      body: Row(
        children: [
          Expanded(child: GameView()),
          Expanded(child: GamePanel())
        ],
      ),
    );
  }
}

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Algorithm algorithm = new Algorithm(size: 3);

    return Container(
      color: Colors.grey[100],
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: algorithm.size,
          ),
          padding: EdgeInsets.all(15),
          itemCount: algorithm.size*algorithm.size,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amber,
              child: Center(child: Text('$index')),
            );
          }
      ),
    );
  }
}

class GamePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        Text('Configurar nodos'),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){}, child: Text('Iniciar'))
      ],
    );
  }
}


class Algorithm{
  List<List<int>> matrix = [];
  int size;

  // Movimientos de los marcadores
  // 0: Vacío, 1: Círculo, 2: Equis

  Algorithm({this.size}){
    matrix = List.generate(size, (_) => List.generate(size, (_) => 0));
  }
  
  void userMove(int row, int col){

  }

  void computerMove(int row, int col){

  }

}